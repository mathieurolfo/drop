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
    
    delegate.user = [[User alloc] init];
    NSLog(@"after init currentDrops is %d", delegate.user.currentDrops);
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    delegate.tabBarController = tabBarController;
    
    PlantController *plantController = [[PlantController alloc] init];
    //delegate.plantController = plantController;
    
    UIImage *plantIcon = [UIImage imageNamed:@"lukefirth.png"];
    UIImage *resizedPlant = [UIImage imageWithCGImage:[plantIcon CGImage]
                             scale:35.0/(plantIcon.scale) orientation:(plantIcon.imageOrientation)];
    plantController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Plant" image:resizedPlant tag:0];
    
    TasksController *tasksController = [[TasksController alloc] init];
    delegate.tasksController = tasksController;
    
    UIImage *tasksIcon = [UIImage imageNamed:@"igorneverov.png"];
    UIImage *resizedTasks = [UIImage imageWithCGImage:[tasksIcon CGImage]
                                                scale:35.0/(tasksIcon.scale) orientation:(tasksIcon.imageOrientation)];
    
    tasksController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Tasks" image:resizedTasks tag:1];
    
    NSArray *controllers = [NSArray arrayWithObjects:plantController, tasksController, nil];
    tabBarController.viewControllers = controllers;
    
    
    
    [delegate.drawer setCenterViewController:tabBarController];
    
}



@end
