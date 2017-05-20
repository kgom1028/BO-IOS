//
//  MenuViewController.m
//  BinaryOptions
//
//  Created by BoHuang on 1/20/17.
//  Copyright © 2017 ITLove007. All rights reserved.
//

#import "MenuViewController.h"
#import "Language.h"
#import "WebViewController.h"
#import "Global.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) setupUI {
    NSURL* url = [[NSBundle mainBundle] URLForResource:@"platform__v4" withExtension:@"mp4"];
    self.avPlayer = [[AVPlayer alloc] initWithURL:url];
    self.avPlayerLayer = [AVPlayerLayer playerLayerWithPlayer:self.avPlayer];
    self.avPlayerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    self.avPlayer.volume = 0;
    self.avPlayer.actionAtItemEnd = AVPlayerActionAtItemEndNone;
    self.avPlayerLayer.frame = self.view.bounds;
    self.view.backgroundColor = [UIColor clearColor];
    [self.view.layer insertSublayer:self.avPlayerLayer atIndex:0];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(playerItemDidReachEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
   // [self refresh];
}

- (void)playerItemDidReachEnd:(NSNotification *) notification
{
    AVPlayerItem *p = [notification object];
    [p seekToTime:kCMTimeZero];
}

- (void)refresh {
    self.view.backgroundColor = [UIColor clearColor];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:0 green:0 blue:0 alpha:0] CGColor], (id)[[UIColor colorWithRed:0 green:0 blue:0 alpha:255] CGColor], nil];
    [self.view.layer insertSublayer:gradient atIndex:1];
    
}

- (void) viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
        [self setupUI];
    [self.avPlayer play];
    self.paused = false;
}

- (void) viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.avPlayer pause];
    self.paused = true;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)appstoreAction:(id)sender {
    NSURL *url = [NSURL URLWithString:kLang(@"apple_store_url")];
    if ([[UIApplication sharedApplication]canOpenURL:url])
        [[UIApplication sharedApplication] openURL:url];
}
- (IBAction)freeDemoAction:(id)sender {
    [Global switchScreen:self withControllerName:@"FreeDemoViewController"];
    
}
- (IBAction)tradingAlertAction:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    WebViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"WebViewController"];
    viewController.url = kLang(@"trading_alert");
    [self presentViewController:viewController animated:true completion:nil];
}
- (IBAction)monthlyBonusAction:(id)sender {
}
- (IBAction)buyOrSellAction:(id)sender {
   /* UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    WebViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"WebViewController"];
    NSString* path =[[NSBundle mainBundle] pathForResource:@"buy_or_sell" ofType:@"html"];
    viewController.filePath = path;
    //[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"buy_or_sell" ofType:@"html"]isDirectory:NO]];
    viewController.url = @"file";
    [self presentViewController:viewController animated:true completion:nil];*/
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    WebViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"WebViewController"];
    viewController.url = kLang(@"buy_or_sell");
    [self presentViewController:viewController animated:true completion:nil];
}
- (IBAction)tutorialAction:(id)sender {
    [Global switchScreen:self withControllerName:@"TutorialViewController"];
}
- (IBAction)weeklyProfitAction:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    WebViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"WebViewController"];
    viewController.url = kLang(@"trader_of_week");
    [self presentViewController:viewController animated:true completion:nil];
}
- (IBAction)tipsAction:(id)sender {
        [Global switchScreen:self withControllerName:@"ProfitHacksViewController"];
}
- (IBAction)macDesktopAction:(id)sender {
  /*  NSString *mailURL = @"mailto:";
    mailURL = [[[[[mailURL stringByAppendingString:kLang(@"feedback_mail")] stringByAppendingString:@"?"] stringByAppendingString:@"subject="] stringByAppendingString:kLang(@"mac_desktop_mail")] stringByAppendingString:@"&body="];
    mailURL = [mailURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString: mailURL]])
        [[UIApplication sharedApplication]  openURL: [NSURL URLWithString: mailURL]];*/
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    WebViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"WebViewController"];
    viewController.url = kLang(@"mac_desktop_url");
    [self presentViewController:viewController animated:true completion:nil];
}
- (IBAction)feedbackAction:(id)sender {
    NSString *mailURL = @"mailto:";
    mailURL = [[[[[mailURL stringByAppendingString:kLang(@"feedback_mail")] stringByAppendingString:@"?"] stringByAppendingString:@"subject="] stringByAppendingString:kLang(@"feedback_subject")] stringByAppendingString:@"&body="];
    mailURL = [mailURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString: mailURL]])
        [[UIApplication sharedApplication]  openURL: [NSURL URLWithString: mailURL]];
}
- (IBAction)warningAction:(id)sender {
    

}

@end
