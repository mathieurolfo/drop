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
#import "CMPopTipView.h"

@interface UserTasksController ()

@end

@implementation UserTasksController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"To-Do";
    // Do any additional setup after loading the view from its nib.
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    
    UIImage *hamburgerIcon = [UIImage imageNamed:@"hamburger.png"];
    UIImage *resizedHam = [UIImage imageWithCGImage:[hamburgerIcon CGImage]
                                              scale:55.0/(hamburgerIcon.scale) orientation:(hamburgerIcon.imageOrientation)];
    
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:resizedHam style:UIBarButtonItemStylePlain  target:delegate action:@selector(menuButtonClicked)];
    menuButton.tintColor = [UIColor colorWithRed:0 green:88.0/255 blue:38.0/255 alpha:1];
    self.navigationItem.leftBarButtonItem = menuButton;
    
    
    UIBarButtonItem *newTasksButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pushTaskDatabaseController)];
    newTasksButton.tintColor = [UIColor colorWithRed:0 green:88.0/255 blue:38.0/255 alpha:1];
    self.navigationItem.rightBarButtonItem = newTasksButton;
    if (delegate.user.lifetimeDrops == 3) {
        [self performSelector:@selector(showTip) withObject:nil afterDelay:0.5f];
    }
    [self.tableView registerNib:[UINib nibWithNibName:@"UserActionCell" bundle:nil] forCellReuseIdentifier:@"usercell"];
}

-(void)showTip {
    NSString *message = @"Click here to pin new tasks to your to-do list.";
    CMPopTipView *popTipView2 = [[CMPopTipView alloc] initWithMessage:message];
    popTipView2.backgroundColor = [UIColor colorWithRed:0 green:88.0/255 blue:38.0/255 alpha:1];
    popTipView2.borderColor = [UIColor colorWithRed:0 green:88.0/255 blue:38.0/255 alpha:1];
    popTipView2.hasGradientBackground = NO;
    popTipView2.has3DStyle = NO;
    [popTipView2 presentPointingAtBarButtonItem:self.navigationItem.rightBarButtonItem animated:YES];
    [self performSelector:@selector(dismissPopView:) withObject:popTipView2 afterDelay:2.5];
}

-(void)dismissPopView: (CMPopTipView *)pop {
    [pop dismissAnimated:YES];
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0;
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
    taskCell.completeTaskButton.imageView.image = [UIImage imageNamed:@"unchecked.png"];
    
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
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Good job!" message:@"You've just earned some drops." delegate:nil cancelButtonTitle:nil otherButtonTitles: nil];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



@end
