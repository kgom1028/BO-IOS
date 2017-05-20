//
//  BasicTutorialViewController.m
//  BinaryOptions
//
//  Created by BoHuang on 1/20/17.
//  Copyright © 2017 ITLove007. All rights reserved.
//

#import "BasicTutorialViewController.h"
#import "Global.h"

@interface BasicTutorialViewController ()

@end

@implementation BasicTutorialViewController


- (void)viewDidLoad {
    [super viewDidLoad];
       self.isPresented = YES;

    self.currentPage = 0;
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
     self.isPresented = YES;
    NSNumber* value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeLeft];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didRotate:)
                                                 name:@"UIDeviceOrientationDidChangeNotification"
                                               object:nil];
    
}
- (void) didRotate:(NSNotification *)notification {
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    
    switch (orientation) {
        case UIDeviceOrientationPortrait:
        case UIDeviceOrientationPortraitUpsideDown:
            // do something for portrait orientation
        {
            CGSize screenSize = [[UIScreen mainScreen] bounds].size;
            
            //_controller.view.frame = CGRectMake(0, (screenSize.height - screenSize.width * 0.7)/2, screenSize.width, screenSize.width * 0.7);
            self.view.frame = CGRectMake(0, 0, screenSize.width, screenSize.height);
            
            break;
        }
        case UIDeviceOrientationLandscapeLeft:
        case UIDeviceOrientationLandscapeRight:
        {
            // do something for landscape orientation
            CGSize screenSize = [[UIScreen mainScreen] bounds].size;
            
            self.view.frame = CGRectMake(0, 0, screenSize.width, screenSize.height);
            break;
        }
        default:
            break;
    }
}
-(void) viewDidAppear:(BOOL)animated{
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
- (IBAction)dismiss:(id)sender
{
    self.isPresented = NO;
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)backAction:(id)sender {
    if(self.currentPage >0)
    {
        [self previousPage];
        
    }else{
        self.isPresented = NO;
        [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
        [[NSNotificationCenter defaultCenter] removeObserver:self];
        NSNumber* value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
        [[UIDevice currentDevice] setValue:value forKey:@"orientation"];

        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(void) nextPage{
    self.currentPage++;
    [self changeScreen:self.currentPage];
}
-(void) changeScreen:(int) currentPage{
    switch (currentPage) {
        case 0:
        {
            [self.previousButton setHidden:YES];
            [self.nextButton setHidden:NO];
            [self.exitButton setHidden:YES];
            [self.openAccount setHidden:YES];
            [self.indicator setImage: [UIImage imageNamed:@"tut_indicator_1.png"]];
            [self.background setImage: [UIImage imageNamed:@"tut_1.png"]];
        }
            break;
        
        case 1:
        {
            [self.previousButton setHidden:NO];
            [self.nextButton setHidden:NO];
            [self.exitButton setHidden:YES];
            [self.openAccount setHidden:YES];
            [self.indicator setImage: [UIImage imageNamed:@"tut_indicator_2.png"]];
            [self.background setImage: [UIImage imageNamed:@"tut_2.png"]];
        }
            break;
        case 2:
        {
            [self.previousButton setHidden:NO];
            [self.nextButton setHidden:NO];
            [self.exitButton setHidden:YES];
            [self.openAccount setHidden:YES];
            [self.indicator setImage: [UIImage imageNamed:@"tut_indicator_3.png"]];
            [self.background setImage: [UIImage imageNamed:@"tut_3.png"]];
        }
            break;
        case 3:
        {
            [self.previousButton setHidden:NO];
            [self.nextButton setHidden:YES];
            [self.exitButton setHidden:NO];
            [self.openAccount setHidden:NO];
            [self.indicator setImage: [UIImage imageNamed:@"tut_indicator_4.png"]];
            [self.background setImage: [UIImage imageNamed:@"tut_4.png"]];
        }
            break;
        default:
            break;
    }
}
-(void) previousPage{
    self.currentPage--;
    [self changeScreen:self.currentPage];
}
- (IBAction)previousAction:(id)sender {
    [self previousPage];
}
- (IBAction)nextAction:(id)sender {
    [self nextPage];
}
- (IBAction)exitAction:(id)sender {
    [Global switchScreen:self withControllerName:@"MenuViewController"];
        self.isPresented = NO;
}
- (IBAction)openAccountAction:(id)sender {
    [Global switchScreen:self withControllerName:@"FreeDemoViewController"];
        self.isPresented = NO;
}

@end
