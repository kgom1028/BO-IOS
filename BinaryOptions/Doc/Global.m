	//
//  Global.m
//  FitMusic
//
//  Created by BoHuang on 7/18/16.
//  Copyright © 2016 Jong. All rights reserved.
//

#import "Global.h"

 NSString* m_baseUrl = @"http://iqpushapp.com/admin/index.php?Api/";
 NSString* m_appsFlyerDevKey =@"wNL8QQaTgFYggaoLRd3RJi";
 NSString* m_appId = @"1157913779";
//NSString* m_baseUrl = @"http://myautomaticweightloss.com/backend/index.php?Api/";



NSString* m_register_token = @"register_token";

@implementation Global

+ (Global *)shared	
{
    static dispatch_once_t onceToken;
    static Global *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[Global alloc] init];
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
+(void)switchScreen:(UIViewController*)viewcon withControllerName: (NSString*)controllerName{
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController* vc = [mainStoryboard instantiateViewControllerWithIdentifier:controllerName];
    
    [viewcon presentViewController:vc animated:true completion:nil];
    
}
+(void)switchScreen:(UIViewController*)viewcon withControllerName: (NSString*)controllerName withTransitionType:(UIModalTransitionStyle) style {
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController* vc = [mainStoryboard instantiateViewControllerWithIdentifier:controllerName];
    vc.modalTransitionStyle = UIModalPresentationPopover;
    [viewcon presentViewController:vc animated:true completion:nil];
    
}

@end
