//
//  MainViewController.m
//  BinaryOptions
//
//  Created by BoHuang on 9/17/16.
//  Copyright © 2016 ITLove007. All rights reserved.
//

#import "MainViewController.h"
#import "WarningViewController.h"
#import "Language.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden =YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ClickGesture:)];
    UITapGestureRecognizer* gesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ClickGesture:)];
    
    [_chinese_view addGestureRecognizer:gesture];
    _chinese_view.tag = 200;
    _chinese_view.userInteractionEnabled = true;
    
    [_english_view addGestureRecognizer:gesture2];
    _english_view.tag = 300;
    _english_view.userInteractionEnabled = true;
    [self reloadUI];
}

- (void)reloadUI {
        _english_lab.text = kLang(@"english");
        _chinese_lab.text = kLang(@"chinese");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) ClickGesture:(UITapGestureRecognizer*)gesture{
    UIView* view = gesture.view;
    int tag = (int)view.tag;
    switch (tag) {
        case 300:{
            [Language userSelectedLanguage:@"Base"];
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            WarningViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"WarningViewController"];
            viewController.title = @"";
            [self presentViewController:viewController animated:true completion:nil];
            /*[self.navigationController pushViewController:viewController animated:YES];*/
        }
            break;
        case 200:{
            [Language userSelectedLanguage:@"zh-Hans"];
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            WarningViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"WarningViewController"];
            viewController.title = @"";
            [self presentViewController:viewController animated:true completion:nil];
        }
            break;
        default:
            break;
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
