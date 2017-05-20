//
//  WebViewController.h
//  BinaryOptions
//
//  Created by BoHuang on 9/17/16.
//  Copyright © 2016 ITLove007. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLAnimatedImageView.h"
#import "IMYWebView.h"

@interface WebViewController : UIViewController<IMYWebViewDelegate, UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet FLAnimatedImageView *loadAnim;
@property (weak, nonatomic) IBOutlet IMYWebView *myWebView;


@property (strong, nonatomic) NSString* url;
@property (strong, nonatomic) NSString* filePath;
@end
