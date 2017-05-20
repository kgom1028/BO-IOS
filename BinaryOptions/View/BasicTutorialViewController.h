//
//  BasicTutorialViewController.h
//  BinaryOptions
//
//  Created by BoHuang on 1/20/17.
//  Copyright © 2017 ITLove007. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BorderButton.h"
@interface BasicTutorialViewController : UIViewController
@property (nonatomic) BOOL isPresented;
@property (nonatomic) int currentPage;
- (IBAction)dismiss:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *exitButton;
@property (weak, nonatomic) IBOutlet BorderButton *previousButton;
@property (weak, nonatomic) IBOutlet BorderButton *nextButton;
@property (weak, nonatomic) IBOutlet UIImageView *indicator;
@property (weak, nonatomic) IBOutlet BorderButton *openAccount;
@property (weak, nonatomic) IBOutlet UIImageView *background;

@end
