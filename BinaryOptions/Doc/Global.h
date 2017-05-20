//
//  Global.h
//  FitMusic
//
//  Created by BoHuang on 7/18/16.
//  Copyright © 2016 Jong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Global : NSObject
+ (Global *)shared;

extern  NSString * m_baseUrl;
extern NSString * m_register_token;
extern NSString * m_appsFlyerDevKey;
extern NSString * m_appId;

+(void)showIndicator:(UIViewController*)viewcon;
+(void)stopIndicator:(UIViewController*)viewcon;
+(void)AlertMessage:(NSString*)message Title:(NSString*)title;
+(void)switchScreen:(UIViewController*)viewcon withControllerName: (NSString*)controllerName;
+(void)switchScreen:(UIViewController*)viewcon withControllerName: (NSString*)controllerName withTransitionType:(UIModalTransitionStyle) style;
@end
