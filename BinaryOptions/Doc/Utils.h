//
//  Utils.h
//  BinaryOptions
//
//  Created by BoHuang on 9/19/16.
//  Copyright © 2016 ITLove007. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Utils : NSObject
+ (Utils *)shared;


+(void)showIndicator:(UIViewController*)viewcon;
+(void)stopIndicator:(UIViewController*)viewcon;
+(void)AlertMessage:(NSString*)message Title:(NSString*)title;
+ (UIColor *)colorFromHexString:(NSString *)hexString;
@end
