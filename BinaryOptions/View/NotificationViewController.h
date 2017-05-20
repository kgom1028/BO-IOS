//
//  NotificationViewController.h
//  FitMusic
//
//  Created by BoHuang on 7/26/16.
//  Copyright © 2016 Jong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic, readwrite) NSMutableArray *notifications;
@property (weak, nonatomic) IBOutlet UIImageView *back_btn;

@end
