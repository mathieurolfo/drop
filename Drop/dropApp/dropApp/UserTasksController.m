//
//  UserTasksController.m
//  dropApp
//
//  Created by Mathieu Rolfo on 11/23/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import "UserTasksController.h"
#import "AppDelegate.h"
#import "TaskDatabaseController.h"
#import "TaskCell.h"
#import "Action.h"

@interface UserTasksController ()

@end

@implementation UserTasksController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Your Tasks";
    // Do any additional setup after loading the view from its nib.
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:delegate action:@selector(menuButtonClicked)];
    self.navigationItem.leftBarButtonItem = menuButton;
    
    
    UIBarButtonItem *newTasksButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pushTaskDatabaseController)];
    self.navigationItem.rightBarButtonItem = newTasksButton;

    [self.tableView registerNib:[UINib nibWithNibName:@"TaskCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    TaskCell *taskCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    Action *action = delegate.user.pinnedTasks[indexPath.row];
    taskCell.nameLabel.text = action.name;
    taskCell.dropLabel.text = [NSString stringWithFormat:@"%d", action.dropValue];
    taskCell.pinTaskButton.hidden = YES;

    return taskCell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    return [delegate.user.pinnedTasks count];
}



-(void)pushTaskDatabaseController
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    TaskDatabaseController *taskDatabase = [[TaskDatabaseController alloc] init];
    [delegate.tasksNav pushViewController:taskDatabase animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
