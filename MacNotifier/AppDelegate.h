//
//  AppDelegate.h
//  MacNotifier
//
//  Created by sassembla on 2013/03/27.
//  Copyright (c) 2013年 KISSAKI Inc,. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#define KEY_PERFIX      (@"-")

@interface AppDelegate : NSObject <NSApplicationDelegate, NSUserNotificationCenterDelegate>

- (void) setArgs:(NSMutableDictionary * )currentArgsDict;

@end
