//
//  AppDelegate.h
//  BinaryOptions
//
//  Created by BoHuang on 9/16/16.
//  Copyright © 2016 ITLove007. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) DBManager *dbManager;


@end

