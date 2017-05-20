//
//  WarningViewController.m
//  BinaryOptions
//
//  Created by BoHuang on 9/17/16.
//  Copyright © 2016 ITLove007. All rights reserved.
//

#import "WarningViewController.h"
#import "Language.h"
#import "Global.h"

@interface WarningViewController ()

@end

@implementation WarningViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden =YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ClickGesture:)];
    [_back_btn addGestureRecognizer:gesture];
    _back_btn.tag = 200;
    _back_btn.userInteractionEnabled = true;

    [self reloadUI];
    
    self.topConstraint.constant = 0;
    self.bottomConstraint.constant = 0;
    [UIView animateWithDuration:1.0f animations:^
     {
         [self.popupview layoutIfNeeded];
     }];
    
}

-(void) ClickGesture:(UITapGestureRecognizer*)gesture{
    UIView* view = gesture.view;
    int tag = (int)view.tag;
    switch (tag) {
        case 200:{
            [self dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        default:
            break;
    }
}

- (void)reloadUI {
 }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)okAction:(id)sender {
    
   /* UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                    message:kLang(@"continue_iq")
                                                   delegate:self
                                          cancelButtonTitle:@"No"
                                          otherButtonTitles:@"Yes", nil];
    alert.tag =100;
    [alert show];*/
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController* vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"MenuViewController"];
    
    [self presentViewController:vc animated:NO completion:nil];

    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(alertView.tag == 100){
        switch(buttonIndex) {
            case 0:
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                                message:kLang(@"alert_redirect")
                                                               delegate:self
                                                      cancelButtonTitle:@"Ok"
                                                      otherButtonTitles:nil];
                alert.tag =200;
                [alert show];
            }
                break;
            case 1:
            {
                UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                UIViewController* vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"MenuViewController"];
                
                [self presentViewController:vc animated:NO completion:nil];
            }
                break;
        }
    }else if (alertView.tag == 200){
        NSURL *url = [NSURL URLWithString:kLang(@"iq_robot_url")];
        if ([[UIApplication sharedApplication]canOpenURL:url])
            [[UIApplication sharedApplication] openURL:url];
    }
    

}

@end
