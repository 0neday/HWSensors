//
//  BluetoothReporter.m
//  HWMonitor
//
//  Created by kozlek on 12.03.13.
//  Copyright (c) 2013 kozlek. All rights reserved.
//

#import "BluetoothGenericDevice.h"

@implementation BluetoothGenericDevice

+ (NSArray*)discoverDevices
{
    NSMutableArray *devices = [[NSMutableArray alloc] init];
    
    for (int index = 0; index < 3; index++) {
        
        BluetoothDeviceType type = kBluetoothDeviceTypeNone;
        CFDictionaryRef matching = MACH_PORT_NULL;
        
        switch (index) {
            case 0:
                matching = IOServiceMatching("BNBMouseDevice");
                type = kBluetoothDeviceTypeMouse;
                break;
                
            case 1:
                matching = IOServiceMatching("AppleBluetoothHIDKeyboard");
                type = kBluetoothDeviceTypeKeyboard;
                break;
                
            case 2:
                matching = IOServiceMatching("BNBTrackpadDevice");
                type = kBluetoothDeviceTypeTrackpad;
                break;
                
            default:
                break;
        }

        if (MACH_PORT_NULL != matching) {
            io_iterator_t iterator = IO_OBJECT_NULL;
            
            if (kIOReturnSuccess == IOServiceGetMatchingServices(kIOMasterPortDefault, matching, &iterator)) {
                if (IO_OBJECT_NULL != iterator) {
                    
                    io_service_t service = MACH_PORT_NULL;
                    
                    while (MACH_PORT_NULL != (service = IOIteratorNext(iterator))) {
                        BluetoothGenericDevice* device = [BluetoothGenericDevice bluetoothGenericDeviceWithService:service ofType:type];
                        
                        if (device) {
                            [devices addObject:device];
                        }
                    }
                    
                    IOObjectRelease(iterator);
                }
            }
        }
    }
    
    return devices;
}

+ (BluetoothGenericDevice*)bluetoothGenericDeviceWithService:(io_service_t)service ofType:(BluetoothDeviceType)type;
{
    BluetoothGenericDevice *me = [[BluetoothGenericDevice alloc] init];
    
    if (me) {
        me.service = service;
        me.deviceType = type;
        me.productName = (__bridge_transfer  NSString *)IORegistryEntryCreateCFProperty(service, CFSTR("Product"), kCFAllocatorDefault, 0);
        
        if (![me getBatteryLevel]) {
            return nil;
        }
    }
    
    return me;
}

-(void)dealloc
{
    if (MACH_PORT_NULL != _service) {
        IOObjectRelease(_service);
    }
}

- (NSData*)getBatteryLevel
{
    NSData *result = nil;
    
    if (MACH_PORT_NULL != _service) {
        CFStringRef batteryLevel = (CFStringRef)IORegistryEntryCreateCFProperty(_service, CFSTR("BatteryPercent"), kCFAllocatorDefault, 0);
        
        if (batteryLevel != IO_OBJECT_NULL) {
            SInt32 bytes = CFStringGetIntValue(batteryLevel);
            result = [NSData dataWithBytes:&bytes length:sizeof(SInt32)];
            CFRelease(batteryLevel);
        }
    }
    
    return result;
}

@end
