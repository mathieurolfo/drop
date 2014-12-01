//
//  SideMenuController.m
//  dropApp
//
//  Created by Mathieu Rolfo on 11/19/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import "SideMenuController.h"
#import "AppDelegate.h"
#import "CompletedTasksController.h"

@interface SideMenuController ()

@end

@implementation SideMenuController

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 2;
            break;
        case 1:
            return 3;
            break;
        case 2:
            return 2;
            break;
    }
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    switch (indexPath.section) {
        case 0: //Plant
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"Plant Dashboard";
                    break;
                case 1:
                    cell.textLabel.text = @"Plant Stats";
                    break;
            }
            break;
        case 1: //Tasks
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"Your To-Do Actions";
                    break;
                case 1:
                    cell.textLabel.text = @"Completed Actions";
                    break;
                case 2:
                    cell.textLabel.text = @"Actions Database";
                    break;
            }
            break;
        case 2: //User
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"Profile Information";
                    break;
                case 1:
                    cell.textLabel.text = @"Log Out";
                    break;
            }
    }
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"    PLANT";
        case 1:
            return @"    ACTIONS";
        case 2:
            return @"   USER";
    }
    return @"";
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UILabel *myLabel = [[UILabel alloc] init];
    myLabel.frame = CGRectMake(0, 0, 320, 22);
    myLabel.font = [UIFont boldSystemFontOfSize:12];
    myLabel.text = [self tableView:tableView titleForHeaderInSection:section];
    myLabel.backgroundColor = [UIColor grayColor];
    
    UIView *headerView = [[UIView alloc] init];
    [headerView addSubview:myLabel];
    
    return headerView;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    //Switch to Plant Controller Home
    if (indexPath.section == 0 && indexPath.row == 0) {
        [delegate.tabBarController setSelectedIndex:0];
        [delegate.drawer closeDrawerAnimated:YES completion:nil];
    }
    
    
    //Push Completed Tasks Controller
    if (indexPath.section == 1 && indexPath.row == 1) {
        [delegate.tabBarController setSelectedIndex:1];
        CompletedTasksController *ctc = [[CompletedTasksController alloc] init];
        [delegate.tasksNav pushViewController:ctc animated:YES];
        [delegate.drawer closeDrawerAnimated:YES completion:nil];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.nameLabel.text = @"Welcome to Drop";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
