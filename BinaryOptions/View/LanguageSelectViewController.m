//
//  LanguageSelectViewController.m
//  BinaryOptions
//
//  Created by BoHuang on 1/20/17.
//  Copyright © 2017 ITLove007. All rights reserved.
//

#import "LanguageSelectViewController.h"
#import "WebViewController.h"
#import "Language.h"
@interface LanguageSelectViewController ()

@end

@implementation LanguageSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)thilandAction:(id)sender {
    [self openWebView:kLang(@"thiland_url")];
}

- (IBAction)englishAction:(id)sender {
    [self openWebView:kLang(@"english_url")];
}
- (IBAction)russianAction:(id)sender {
    [self openWebView:kLang(@"russian_url")];
}
- (IBAction)germanAction:(id)sender {
    [self openWebView:kLang(@"german_url")];
}
- (IBAction)italianAction:(id)sender {
    [self openWebView:kLang(@"italian_url")];
}

- (IBAction)brazilianAction:(id)sender {
    [self openWebView:kLang(@"brazilian_url")];
}
- (IBAction)arabicAction:(id)sender {
    [self openWebView:kLang(@"arabic_url")];
}
- (IBAction)indonesianAction:(id)sender {
    [self openWebView:kLang(@"indonesian_url")];
}
- (IBAction)frenchAction:(id)sender {
    [self openWebView:kLang(@"french_url")];
}
- (IBAction)spanishAction:(id)sender {
    [self openWebView:kLang(@"spanish_url")];
}
- (IBAction)koreanAction:(id)sender {
    [self openWebView:kLang(@"korean_url")];
}
- (IBAction)svenskaAction:(id)sender {
     [self openWebView:kLang(@"svenska_url")];
}
- (IBAction)portuguesAction:(id)sender {
     [self openWebView:kLang(@"portugues_url")];
}
- (IBAction)norskAction:(id)sender {
     [self openWebView:kLang(@"norsk_url")];
}
- (IBAction)chineseAction:(id)sender {
    [self openWebView:kLang(@"chinese_url")];
}

- (void) openWebView:(NSString*)url{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    WebViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"WebViewController"];
    viewController.url = url;
    [self presentViewController:viewController animated:true completion:nil];
}
- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
