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

@interface TaskDatabaseController ()

@end

@implementation TaskDatabaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"New Tasks";
    // Do any additional setup after loading the view from its nib.
    [self initDatabase];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TaskCell *taskCell = [[TaskCell alloc] init];
    
    Action *taskAction = (self.tasksArray[indexPath.row]);
    taskCell.taskTitleLabel.text = taskAction.name;
    taskCell.dropCountLabel.text = [NSString stringWithFormat:@"%d", taskAction.dropValue];
    return taskCell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tasksArray count];
}

-(void) initDatabase
{
    NSMutableArray *tasksArray = [[NSMutableArray alloc] init];
    
    Action *action0 = [[Action alloc] init];
    action0.name = @"Take Shorter Showers";
    action0.dropValue = 5;
    [tasksArray addObject:action0];
    
    Action *action1 = [[Action alloc] init];
    action1.name = @"Install Low-flow Showerhead";
    action1.dropValue = 20;
    [tasksArray addObject:action1];
    self.tasksArray = tasksArray;
}



@end
