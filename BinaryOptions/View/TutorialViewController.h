//
//  TutorialViewController.h
//  BinaryOptions
//
//  Created by BoHuang on 1/20/17.
//  Copyright © 2017 ITLove007. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BorderButton.h"

@interface TutorialViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet BorderButton *previous;
@property (weak, nonatomic) IBOutlet UIButton *exit;
@property (weak, nonatomic) IBOutlet BorderButton *nextButton;
@property (weak, nonatomic) IBOutlet UIImageView *indicator;

@end
