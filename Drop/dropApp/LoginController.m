//
//  LoginController.m
//  dropApp
//
//  Created by Mathieu Rolfo on 11/16/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import "LoginController.h"
#import "AppDelegate.h"
#import "PlantController.h"
#import "UserTasksController.h"
#import "User.h"

@interface LoginController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.usernameField.returnKeyType = UIReturnKeyDone;
    self.passwordField.returnKeyType = UIReturnKeyDone;
    self.passwordField.secureTextEntry = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signUpPressed:(id)sender {
    
}

- (IBAction)loginPressed:(id)sender {
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    User *testUser = [delegate.userDatabase.userDatabase objectForKey:self.usernameField.text];
    
    if (testUser) {
        NSLog(@"this is an existing user");
        delegate.user = testUser;
    } else {
        NSLog(@"this is a brand new user");
        delegate.user = [[User alloc] init];
        delegate.user.name = self.usernameField.text;
        delegate.user.password = self.passwordField.text;
    }
    
    //Initializes the user. Currently creates a default user, but will eventually check the existing database.
    
    //Creates the tab bar controller. Won't change.
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    delegate.tabBarController = tabBarController;
    
    //Create the plant and task controllers, the containing navigation controllers, and adds the icon to the tab bar.
    PlantController *plantController = [[PlantController alloc] init];
    UINavigationController *plantNavController = [[UINavigationController alloc] initWithRootViewController:plantController];
    delegate.plantController = plantController;
    
    
    UserTasksController *tasksController = [[UserTasksController alloc] init];
    delegate.tasksController = tasksController;
    UINavigationController *tasksNavController = [[UINavigationController alloc] initWithRootViewController:tasksController];

    delegate.tasksNav = tasksNavController;
    //Create and add the images to the tab bar.
    UIImage *plantIcon = [UIImage imageNamed:@"lukefirth.png"];
    UIImage *resizedPlant = [UIImage imageWithCGImage:[plantIcon CGImage]
                             scale:35.0/(plantIcon.scale) orientation:(plantIcon.imageOrientation)];
    UIImage *tasksIcon = [UIImage imageNamed:@"igorneverov.png"];
    UIImage *resizedTasks = [UIImage imageWithCGImage:[tasksIcon CGImage]
                                                scale:35.0/(tasksIcon.scale) orientation:(tasksIcon.imageOrientation)];
    
    plantController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Plant" image:resizedPlant tag:0];
    tasksController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Tasks" image:resizedTasks tag:1];
    
    //Finish initializing the tab bar controller.
    NSArray *controllers = [NSArray arrayWithObjects:plantNavController, tasksNavController, nil];
    tabBarController.viewControllers = controllers;
    
    [delegate.drawer setCenterViewController:tabBarController];
    [delegate enableDrawerAccess];
    
}

#pragma mark Text Field Methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.text.length == 0) {
        NSLog(@"We've got an empty string here");
    }
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    textField.text = @"";
    return YES;
}


@end
