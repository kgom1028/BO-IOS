//
//  MenuViewController.h
//  BinaryOptions
//
//  Created by BoHuang on 1/20/17.
//  Copyright © 2017 ITLove007. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface MenuViewController : UIViewController
@property (strong, nonatomic) AVPlayer* avPlayer;
@property (strong, nonatomic) AVPlayerLayer* avPlayerLayer;
@property (assign, nonatomic) bool paused;
@end
