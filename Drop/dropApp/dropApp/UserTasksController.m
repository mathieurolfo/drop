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
#import "UserActionCell.h"
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

    [self.tableView registerNib:[UINib nibWithNibName:@"UserActionCell" bundle:nil] forCellReuseIdentifier:@"usercell"];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    UserActionCell *taskCell = [tableView dequeueReusableCellWithIdentifier:@"usercell"];
    Action *action = delegate.user.pinnedTasks[indexPath.row];
    taskCell.nameLabel.text = action.name;
    taskCell.dropLabel.text = [NSString stringWithFormat:@"%d", action.dropValue];
    NSLog(@"%@", taskCell.dropLabel.text);
    taskCell.delegate = self;
    taskCell.cellIndex = indexPath.row;
    

    return taskCell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    return [delegate.user.pinnedTasks count];
}

-(void)dismissAlert: (UIAlertView *)alert {
    [alert dismissWithClickedButtonIndex:0 animated:YES];
}

-(void)didCompleteTaskAtIndex:(NSInteger)cellIndex
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    Action *action = delegate.user.pinnedTasks[cellIndex];
    
    delegate.user.lifetimeDrops += action.dropValue;
    delegate.user.currentDrops += action.dropValue;
    
    
    
    //how to format to short style?
    action.dateAdded = [NSDate date];
    
    [delegate.user.completedTasks addObject:action];
    [delegate.user.pinnedTasks removeObjectAtIndex:cellIndex];


    [self.tableView reloadData];
    [delegate.plantController refreshScreen];
    
    //Notification here
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Drops added" delegate:nil cancelButtonTitle:nil otherButtonTitles: nil];
    [alert show];
    [self performSelector:@selector(dismissAlert:) withObject:alert afterDelay:1.0f];
}

-(void)didRemoveTaskAtIndex:(NSInteger)cellIndex
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.user.pinnedTasks removeObjectAtIndex:cellIndex];    
    [self.tableView reloadData];
    [delegate.plantController refreshScreen];

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
