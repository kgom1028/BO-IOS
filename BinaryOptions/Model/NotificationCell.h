//
//  NotificationCell.h
//  FitMusic
//
//  Created by BoHuang on 7/26/16.
//  Copyright © 2016 Jong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *notfication_text;
@property (weak, nonatomic) IBOutlet UILabel *notification_time;

@end
