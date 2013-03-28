//
//  AppDelegate.m
//  MacNotifier
//
//  Created by sassembla on 2013/03/27.
//  Copyright (c) 2013年 KISSAKI Inc,. All rights reserved.
//

#import "AppDelegate.h"

#define KEY_TITLE       (@"-t")
#define KEY_SUBTITLE    (@"-sub")
#define KEY_MESSAGE     (@"-m")
#define KEY_SOUND       (@"-s")
#define KEY_REPLACEUNDERSCORETOSPACE        (@"-replaceunderscore")
#define VALUE_UNDERSCORE    (@"_")
#define VALUE_SPACE         (@" ")

#define KEY_VERSION     (@"-v")
#define VERSION         (@"0.0.14")

#define NOTIFICATION_KEY_USERNOTIFICATION   (@"NSApplicationLaunchUserNotificationKey")

@implementation AppDelegate

NSDictionary * argsDict;

- (void) setArgs:(NSMutableDictionary * )currentArgsDict {
	argsDict = [[NSDictionary alloc]initWithDictionary:currentArgsDict];
}

- (void)applicationDidFinishLaunching:(NSNotification * ) aNotification
{
    @try {
        NSDictionary * userInfo = aNotification.userInfo;
        if ([userInfo valueForKey:NOTIFICATION_KEY_USERNOTIFICATION]) {
//            NSUserNotification * nt = [userInfo valueForKey:NOTIFICATION_KEY_USERNOTIFICATION];
//            NSLog(@"nt info %@", nt.userInfo);
            exit(0);
        }
        
        NSAssert1([argsDict valueForKey:KEY_TITLE], @"%@ title required", KEY_TITLE);
        NSAssert1([argsDict valueForKey:KEY_MESSAGE], @"%@ message required", KEY_MESSAGE);
        
        if ([argsDict valueForKey:KEY_VERSION]) NSLog(@"version %@", VERSION);
        

        
        NSMutableDictionary * options = [NSMutableDictionary dictionary];
        options[@"info"] = @"activate!!!";
        
        NSUserNotification * newUserNotification = [NSUserNotification new];
        newUserNotification.title = argsDict[KEY_TITLE];
        newUserNotification.subtitle = argsDict[KEY_SUBTITLE];
        newUserNotification.informativeText = argsDict[KEY_MESSAGE];

        if (argsDict[KEY_REPLACEUNDERSCORETOSPACE]) newUserNotification.informativeText = [argsDict[KEY_MESSAGE] stringByReplacingOccurrencesOfString:VALUE_UNDERSCORE withString:VALUE_SPACE];
        
        newUserNotification.userInfo = options;
        
        if (argsDict[KEY_SOUND]) newUserNotification.soundName = argsDict[KEY_SOUND];
        
        
        NSUserNotificationCenter * center = [NSUserNotificationCenter defaultUserNotificationCenter];
        center.delegate = self;
        [center deliverNotification:newUserNotification];
    }
    @catch (NSException * e) {
        NSLog(@"error:%@", e);
        exit(0);
    }
}


- (void)userNotificationCenter:(NSUserNotificationCenter *)center didDeliverNotification:(NSUserNotification * )notification
{
    exit(0);
}


@end
