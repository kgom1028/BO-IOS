//
//  TutorialViewController.m
//  BinaryOptions
//
//  Created by BoHuang on 1/20/17.
//  Copyright © 2017 ITLove007. All rights reserved.
//

#import "TutorialViewController.h"
#import "WebViewController.h"
#import "Global.h"
#import "Language.h"

@interface TutorialViewController ()

@end

@implementation TutorialViewController

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
- (IBAction)basicTutorialAction:(id)sender {
    [Global switchScreen:self withControllerName:@"BasicTutorialViewController"];
    
}
- (IBAction)videoTutorialAction:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    WebViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"WebViewController"];
    viewController.url = kLang(@"video_tutorial_url");
    [self presentViewController:viewController animated:true completion:nil];
}
- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
