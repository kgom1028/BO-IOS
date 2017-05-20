//
//  NotificationViewController.m
//  FitMusic
//
//  Created by BoHuang on 7/26/16.
//  Copyright © 2016 Jong. All rights reserved.
//

#import "NotificationViewController.h"
#import "NotificationCell.h"
#import "MessageModel.h"
#import "AppDelegate.h"
#import "Utils.h"

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ClickGesture:)];
    [_back_btn addGestureRecognizer:gesture];
    _back_btn.tag = 200;
    _back_btn.userInteractionEnabled = true;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
#pragma mark - tableView
#pragma mark - Table view data source
- (void)viewWillAppear:(BOOL)animated
{
    [self getNotifications];
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    if (editingStyle == UITableViewCellEditingStyleDelete) {
    //        mobileSvc_Message* currentMessage = [messages objectAtIndex:indexPath.row];
    //        [self archiveMessage: [currentMessage Id_]];
    //
    //        [messages removeObjectAtIndex:indexPath.row];
    //        [messageTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    //
    //    }
    //    NSLog(@"Done editing");
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_notifications count];
}
//rgb(178,34,34)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NotificationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NotificationCell" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[NotificationCell alloc] initWithStyle:UITableViewCellStyleDefault
                                reuseIdentifier:@"NotificationCell"];
    }
    
    MessageModel * model = [_notifications objectAtIndex:indexPath.row];
    cell.notfication_text.text = model.content;
    cell.notfication_text.textColor = [UIColor whiteColor];
    cell.notification_time.text = model.time;
    if(indexPath.row % 2 == 0)
    {
        
        cell.contentView.backgroundColor = [Utils colorFromHexString:@"f74e0c"];
    }else
        cell.contentView.backgroundColor = [Utils colorFromHexString:@"33343A"];
   
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   /* ForumCellModel* currentForum = [forumes objectAtIndex:indexPath.row];
    DiscussionViewController* discussionViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DiscussionViewController"];
    discussionViewController.parent_forum = currentForum;
    [self.navigationController pushViewController:discussionViewController animated:YES];*/
    
}
-(void) ClickGesture:(UITapGestureRecognizer*)gesture{
    UIView* view = gesture.view;
    int tag = (int)view.tag;
      switch (tag) {
        case 200:{
            [self dismissViewControllerAnimated:YES completion:nil];
        }
            break;
            
        default:
            break;
    }
}

-(void) getNotifications {
    if(!_notifications)
        _notifications = [[NSMutableArray alloc] init];
    [_notifications removeAllObjects];
    AppDelegate* delegate = [[UIApplication sharedApplication] delegate];
    
    NSMutableArray* notifications = [delegate.dbManager getMessages:0];
    for(MessageModel* message in notifications)
    {
        MessageModel * smodel = [MessageModel alloc];
        smodel.id = message.id;
        smodel.content =message.content;
        
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate *myDate = [df dateFromString: message.time];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];        [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"] ];
        [dateFormatter setDateFormat:@"EEE, d MMM yyyy HH:mm:ss"];
        [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
        NSDate *date = [NSDate date];
        NSString *dateString = [dateFormatter stringFromDate:date];
        smodel.time =dateString;
                    
                    
        [_notifications addObject:smodel];
    }
    [_tableView reloadData];
 
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [cell setAlpha:0.f];
    [UIView animateWithDuration:0.5f delay:0.1f options:UIViewAnimationOptionCurveEaseIn animations:^{
        [cell setAlpha:1.f];
    } completion:^(BOOL finished) {
    }];
}
@end
