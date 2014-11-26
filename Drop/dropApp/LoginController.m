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

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginPressed:(id)sender {
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    //Initializes the user. Currently creates a default user, but will eventually check the existing database.
    delegate.user = [[User alloc] init];
    
    //Creates the tab bar controller. Won't change.
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    delegate.tabBarController = tabBarController;
    
    //Create the plant and task controllers, the containing navigation controllers, and adds the icon to the tab bar.
    PlantController *plantController = [[PlantController alloc] init];
    UINavigationController *plantNavController = [[UINavigationController alloc] initWithRootViewController:plantController];
    
    
    UserTasksController *tasksController = [[UserTasksController alloc] init];
    delegate.tasksController = tasksController;
    UINavigationController *tasksNavController = [[UINavigationController alloc] initWithRootViewController:tasksController];

    
    UIImage *plantIcon = [UIImage imageNamed:@"lukefirth.png"];
    UIImage *resizedPlant = [UIImage imageWithCGImage:[plantIcon CGImage]
                             scale:35.0/(plantIcon.scale) orientation:(plantIcon.imageOrientation)];
    UIImage *tasksIcon = [UIImage imageNamed:@"igorneverov.png"];
    UIImage *resizedTasks = [UIImage imageWithCGImage:[tasksIcon CGImage]
                                                scale:35.0/(tasksIcon.scale) orientation:(tasksIcon.imageOrientation)];
    
    

    plantController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Plant" image:resizedPlant tag:0];
    tasksController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Tasks" image:resizedTasks tag:1];
    
    NSArray *controllers = [NSArray arrayWithObjects:plantNavController, tasksNavController, nil];
    tabBarController.viewControllers = controllers;
    
    [delegate.drawer setCenterViewController:tabBarController];
    
}



@end
