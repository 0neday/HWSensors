//
//  ColorTheme.m
//  HWMonitor
//
//  Created by kozlek on 01.03.13.
//  Copyright (c) 2013 kozlek. All rights reserved.
//

#import "ColorTheme.h"

static NSMutableDictionary *gColorThemeList;
static NSMutableArray *gColorThemeIndex;

@implementation ColorTheme

+ (NSArray*)createColorThemes
{
    gColorThemeList = [NSMutableDictionary dictionary];
    gColorThemeIndex = [NSMutableArray array];
    
    ColorTheme *theme = [[ColorTheme alloc] init];
    theme.name = @"Default";
    theme.toolbarEndColor = [NSColor colorWithCalibratedRed:0.05 green:0.25 blue:0.85 alpha:0.95];
    theme.toolbarStartColor = [theme.toolbarEndColor highlightWithLevel:0.6];
    theme.toolbarTitleColor = [NSColor colorWithCalibratedWhite:1.0 alpha:1.0];
    theme.toolbarShadowColor = [NSColor colorWithCalibratedWhite:1.0 alpha:0.3];
    theme.toolbarStrokeColor = [NSColor colorWithCalibratedWhite:0.0 alpha:0.35];
    theme.listBackgroundColor = [NSColor colorWithCalibratedWhite:1.0 alpha:0.95];
    theme.listStrokeColor = [NSColor colorWithCalibratedWhite:0.15 alpha:0.35];
    theme.groupStartColor = [NSColor colorWithCalibratedWhite:0.95 alpha:0.5];
    theme.groupEndColor = [NSColor colorWithCalibratedWhite:0.85 alpha:0.5];
    theme.groupTitleColor = [NSColor colorWithCalibratedWhite:0.6 alpha:1.0];
    theme.itemTitleColor = [NSColor colorWithCalibratedWhite:0.15 alpha:1.0];
    theme.itemSubTitleColor = [NSColor colorWithCalibratedWhite:0.45 alpha:1.0];
    theme.itemValueTitleColor = [NSColor colorWithCalibratedWhite:0.0 alpha:1.0];
    theme.useDarkIcons = YES;
    
    [gColorThemeList setObject:theme forKey:theme.name];
    [gColorThemeIndex addObject:theme];
    
    theme = [[ColorTheme alloc] init];
    theme.name = @"Gray";
    theme.toolbarEndColor = [NSColor colorWithCalibratedWhite:0.23 alpha:0.95];
    theme.toolbarStartColor = [theme.toolbarEndColor highlightWithLevel:0.55];
    theme.toolbarTitleColor = [NSColor colorWithCalibratedWhite:1.0 alpha:1.0];
    theme.toolbarShadowColor = [NSColor colorWithCalibratedWhite:0.7 alpha:0.3];
    theme.toolbarStrokeColor = [NSColor colorWithCalibratedWhite:0.0 alpha:0.7];    
    theme.listBackgroundColor = [NSColor colorWithCalibratedWhite:1.0 alpha:0.95];
    theme.listStrokeColor = [NSColor colorWithCalibratedWhite:0.15 alpha:0.35];
    theme.groupStartColor = [NSColor colorWithCalibratedWhite:0.95 alpha:0.5];
    theme.groupEndColor = [NSColor colorWithCalibratedWhite:0.85 alpha:0.5];
    theme.groupTitleColor = [NSColor colorWithCalibratedWhite:0.6 alpha:1.0];
    theme.itemTitleColor = [NSColor colorWithCalibratedWhite:0.15 alpha:1.0];
    theme.itemSubTitleColor = [NSColor colorWithCalibratedWhite:0.45 alpha:1.0];
    theme.itemValueTitleColor = [NSColor colorWithCalibratedWhite:0.0 alpha:1.0];
    theme.useDarkIcons = YES;
    
    [gColorThemeList setObject:theme forKey:theme.name];
    [gColorThemeIndex addObject:theme];
    
    theme = [[ColorTheme alloc] init];
    theme.name = @"Dark";
    theme.toolbarEndColor = [NSColor colorWithCalibratedRed:0.03 green:0.23 blue:0.8 alpha:0.98];
    theme.toolbarStartColor = [theme.toolbarEndColor highlightWithLevel:0.55];
    theme.toolbarTitleColor = [NSColor colorWithCalibratedWhite:1.0 alpha:1.0];
    theme.toolbarShadowColor = [NSColor colorWithCalibratedWhite:1.0 alpha:0.3];
    theme.toolbarStrokeColor = [NSColor colorWithCalibratedWhite:0.0 alpha:0.35];
    theme.listBackgroundColor = [NSColor colorWithCalibratedWhite:0.15 alpha:0.95];
    theme.listStrokeColor = [NSColor colorWithCalibratedWhite:0.0 alpha:0.55];
    theme.groupStartColor = [NSColor colorWithCalibratedWhite:0.2 alpha:0.5];
    theme.groupEndColor = [NSColor colorWithCalibratedWhite:0.14 alpha:0.5];
    theme.groupTitleColor = [NSColor colorWithCalibratedWhite:0.45 alpha:1.0];
    theme.itemTitleColor = [NSColor colorWithCalibratedWhite:0.85 alpha:1.0];
    theme.itemSubTitleColor = [NSColor colorWithCalibratedWhite:0.65 alpha:1.0];
    theme.itemValueTitleColor = [NSColor colorWithCalibratedWhite:0.95 alpha:1.0];
    theme.useDarkIcons = NO;
    
    [gColorThemeList setObject:theme forKey:theme.name];
    [gColorThemeIndex addObject:theme];
    
    return gColorThemeList.allValues;
}

+(ColorTheme*)colorThemeByName:(NSString*)name
{
    if (!gColorThemeList)
        [ColorTheme createColorThemes];

    ColorTheme *theme = [gColorThemeList objectForKey:name];

    return theme ? theme : [gColorThemeList objectForKey:@"Default"];
}

+(ColorTheme*)colorThemeByIndex:(NSUInteger)index
{
    if (!gColorThemeList)
        [ColorTheme createColorThemes];

    ColorTheme *theme = [gColorThemeIndex objectAtIndex:index];

    return theme ? theme : [gColorThemeList objectForKey:@"Default"];
}

@end
