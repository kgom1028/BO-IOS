//
//  ProfitHacksViewController.m
//  BinaryOptions
//
//  Created by BoHuang on 4/21/17.
//  Copyright © 2017 ITLove007. All rights reserved.
//
#import "WebViewController.h"
#import "Language.h"

#import "ProfitHacksViewController.h"

@interface ProfitHacksViewController ()

@end

@implementation ProfitHacksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
- (IBAction)profitHackAction:(id)sender {
    UIButton* button = (UIButton*)sender;
    int tag = button.tag;
    switch (tag) {
        case 1:
        {
            [self openWebView:kLang(@"tip_1_url")];
        }
            break;
        case 2:
        {
            [self openWebView:kLang(@"tip_2_url")];
        }
            break;
        case 3:
        {
            [self openWebView:kLang(@"tip_3_url")];
        }
        case 4:
        {
            [self openWebView:kLang(@"tip_4_url")];
        }
            break;
        case 5:
        {
            [self openWebView:kLang(@"tip_5_url")];
        }
            break;
        case 6:
        {
            [self openWebView:kLang(@"tip_6_url")];
        }
            break;
        case 7:
        {
            [self openWebView:kLang(@"tip_7_url")];
        }
            break;
        case 8:
        {
            [self openWebView:kLang(@"tip_8_url")];
        }
            break;
        case 9:
        {
            [self openWebView:kLang(@"tip_9_url")];
        }
            break;
        case 10:
        {
            [self openWebView:kLang(@"tip_10_url")];
        }
            break;
        default:
            break;
    }
    
}

- (void)openWebView:(NSString*)url {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    WebViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"WebViewController"];
    viewController.url = url;
    [self presentViewController:viewController animated:true completion:nil];
}
- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
