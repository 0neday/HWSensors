//
//  HWMGroup.h
//  HWMonitor
//
//  Created by Kozlek on 15/11/13.
//  Copyright (c) 2013 kozlek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class HWMSensor;

@interface HWMGroup : NSManagedObject

@property (nonatomic, retain) NSString * format;
@property (nonatomic, retain) NSString * representation;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * order;
@property (nonatomic, retain) NSImage *icon;
@property (nonatomic, retain) NSSet *sensors;
@end

@interface HWMGroup (CoreDataGeneratedAccessors)

- (void)addSensorsObject:(HWMSensor *)value;
- (void)removeSensorsObject:(HWMSensor *)value;
- (void)addSensors:(NSSet *)values;
- (void)removeSensors:(NSSet *)values;

@end
