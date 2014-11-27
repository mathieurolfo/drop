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
    self.title = @"New Tasks";
    [self.tableView registerNib:[UINib nibWithNibName:@"TaskCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    // Do any additional setup after loading the view from its nib.
    ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didPinTaskAtIndex:(NSInteger)cellIndex
{
    NSLog(@"pinned task");
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    Action *action = delegate.tasksDatabase[cellIndex];
    [delegate.user.pinnedTasks addObject:action];
    
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
    
    
    return (UITableViewCell *)taskCell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    return [delegate.tasksDatabase count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
