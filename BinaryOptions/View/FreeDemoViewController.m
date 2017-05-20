//
//  FreeDemoViewController.m
//  BinaryOptions
//
//  Created by BoHuang on 1/20/17.
//  Copyright © 2017 ITLove007. All rights reserved.
//

#import "FreeDemoViewController.h"
#import "Language.h"
#import "Global.h"

@interface FreeDemoViewController ()

@end

@implementation FreeDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)freeDemoAction:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                    message:kLang(@"alert_freedemo")
                                                   delegate:self
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];

    [alert show];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
        switch(buttonIndex) {
            case 0:
            {
                [Global switchScreen:self withControllerName:@"LanguageSelectViewController"];
            }
                break;

        }
}
- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
