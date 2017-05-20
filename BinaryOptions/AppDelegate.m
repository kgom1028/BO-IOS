//
//  AppDelegate.m
//  BinaryOptions
//
//  Created by BoHuang on 9/16/16.
//  Copyright © 2016 ITLove007. All rights reserved.
//

#import "AppDelegate.h"
#import "NetworkParser.h"
#import "Firebase.h"
#import <AppsFlyerLib/AppsFlyerTracker.h>
#import "BasicTutorialViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [FIRApp configure];
    [AppsFlyerTracker sharedTracker].appsFlyerDevKey= m_appsFlyerDevKey;
    [AppsFlyerTracker sharedTracker].appleAppID = m_appId;
    [self initService];
    [self initDatabase];

        return YES;
}
-(void) initService
{
    // Register the supported interaction types.
    
    UIUserNotificationType types = UIUserNotificationTypeBadge |
    
    UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    
    UIUserNotificationSettings *mySettings =
    
    [UIUserNotificationSettings settingsForTypes:types categories:nil];
    
    [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
    
    
    
    // Register for remote notifications.
    
    [[UIApplication sharedApplication] registerForRemoteNotifications];
}
- (void)application:(UIApplication*)application didReceiveRemoteNotification:(NSDictionary*)userInfo
{
    NSDictionary* aps = [userInfo valueForKey:@"aps"];
    NSString* message = [aps valueForKey:@"alert"];
    if(_dbManager == nil)
        [self initDatabase];
    [_dbManager insertMessage:message];
    UIApplicationState state = [application applicationState];
    if (state == UIApplicationStateActive) {
        NSString *cancelTitle = @"Close";
        NSString *showTitle = @"Show";
        NSString *message = [[userInfo valueForKey:@"aps"] valueForKey:@"alert"];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"BinaryOptions Alert"
                                                            message:message
                                                           delegate:self
                                                  cancelButtonTitle:cancelTitle
                                                  otherButtonTitles:showTitle, nil];
        [alertView show];
    } else {
        //Do stuff that you would do if the application was not active
    }
    
}
-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    NSString* newToken = [deviceToken description];
    newToken = [newToken stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    newToken = [newToken stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSLog(@"My token is: %@", newToken);
    
    //UserInfo *env = [UserInfo shared];
    //env.token = newToken;
    NetworkParser * manager = [NetworkParser shared];
    [manager onUpdateToken:newToken withCompletionBlock:^(NSDictionary *dict, NSError *error) {
        if (error == nil) {
            //    [Global parseUserProfile:dict];
            //
            //  goto login activity
            NSString* response = [dict valueForKey:@"response"];
            if([response isEqual:@"success"])
            {
                NSLog(@"Update token success");
            }
        }else{
            // register failed
            NSLog(@"Update token faild");
        }
    }];
    
}
-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    // Track Installs, updates & sessions(app opens) (You must include this API to enable tracking)
    [[AppsFlyerTracker sharedTracker] trackAppLaunch];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void) initDatabase{
    if(_dbManager == nil)
        _dbManager = [[DBManager alloc] initWithDatabaseFilename:@"binaryoptions_db.db"];
}


- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    UIViewController *parentViewController = [[[UIApplication sharedApplication] delegate] window].rootViewController;
    
    while (parentViewController.presentedViewController != nil){
        parentViewController = parentViewController.presentedViewController;
    }
    if ([parentViewController isKindOfClass:[BasicTutorialViewController class]])
    {
        BasicTutorialViewController *currentViewController = (BasicTutorialViewController *) parentViewController;
        if (currentViewController.isPresented)
        {
            return UIInterfaceOrientationMaskLandscape;
        }
        else return UIInterfaceOrientationMaskPortrait;
    }
    else return UIInterfaceOrientationMaskPortrait;
}

@end
