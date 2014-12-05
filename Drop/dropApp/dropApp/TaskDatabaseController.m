//
//  TaskDatabaseController.m
//  dropApp
//
//  Created by Mathieu Rolfo on 11/26/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import "TaskDatabaseController.h"
#import "TaskCell.h"
#import "Action.h"
#import "AppDelegate.h"

@interface TaskDatabaseController ()

@end

@implementation TaskDatabaseController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Actions Library";
    [self.tableView registerNib:[UINib nibWithNibName:@"TaskCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    // Do any additional setup after loading the view from its nib.
    ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dismissAlert: (UIAlertView *)alert {
    [alert dismissWithClickedButtonIndex:0 animated:YES];
}

-(void)didPinTaskAtIndex:(NSInteger)cellIndex
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    Action *action = delegate.tasksDatabase[cellIndex];
    [delegate.user.pinnedTasks addObject:action];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Task pinned" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    [alert show];
    [self performSelector:@selector(dismissAlert:) withObject:alert afterDelay:0.8f];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell
  *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    TaskCell *taskCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    Action *taskAction = (delegate.tasksDatabase[indexPath.row]);
    taskCell.nameLabel.text = taskAction.name;
    taskCell.dropLabel.text = [NSString stringWithFormat:@"%d", taskAction.dropValue];
    taskCell.cellIndex = indexPath.row;
    taskCell.delegate = self;
    taskCell.pinTaskButton.titleLabel.textColor = [UIColor colorWithRed:0 green:88.0/255 blue:38.0/255 alpha:1];
    return (UITableViewCell *)taskCell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    return [delegate.tasksDatabase count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    [self didPinTaskAtIndex:indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
