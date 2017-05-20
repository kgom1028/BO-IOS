//
//  Utils.m
//  BinaryOptions
//
//  Created by BoHuang on 9/19/16.
//  Copyright © 2016 ITLove007. All rights reserved.
//

#import "Utils.h"
@implementation Utils
+ (Utils *)shared
{
    static dispatch_once_t onceToken;
    static Utils *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[Utils alloc] init];
    });
    return instance;
}


+(void)showIndicator:(UIViewController*)viewcon{
    UIActivityIndicatorView* view = (UIActivityIndicatorView*)[viewcon.view viewWithTag:1000];
    if(view == nil){
        CGFloat width = 60.0;
        CGFloat height = 60.0;
        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        [indicatorView setColor:[UIColor blackColor]];
        indicatorView.center = viewcon.view.center;
        indicatorView.tag = 1000;
        [viewcon.view addSubview:indicatorView];
        [viewcon.view bringSubviewToFront:indicatorView];
        
        view = indicatorView;
    }
    
    view.hidden = false;
    [view startAnimating];
}
+(void)stopIndicator:(UIViewController*)viewcon{
    UIActivityIndicatorView* view = (UIActivityIndicatorView*)[viewcon.view viewWithTag:1000];
    if(view != nil){
        view.hidden = YES;
        [view stopAnimating];
    }
}
+(void)AlertMessage:(NSString*)message Title:(NSString*)title{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:title
                          message:message
                          delegate:nil
                          cancelButtonTitle:@"Ok"
                          otherButtonTitles:nil];
    [alert show];
}

+ (UIColor *)colorFromHexString:(NSString *)hexString
{
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    
    if ([cString length] != 6) return [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}
@end