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
#import <QuartzCore/QuartzCore.h>
@interface LoginController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (strong, nonatomic) UIGestureRecognizer *tapper;
@end

@implementation LoginController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.usernameField.returnKeyType = UIReturnKeyDone;
    self.passwordField.returnKeyType = UIReturnKeyDone;
    self.passwordField.secureTextEntry = YES;
    
    _tapper = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    _tapper.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:_tapper];
    //self.view.backgroundColor = [UIColor colorWithRed:0 green:88.0/255 blue:38.0/255 alpha:1];
    
    self.login.layer.cornerRadius = 10;
    self.login.clipsToBounds = YES;
    self.signup.layer.cornerRadius = 10;
    self.signup.clipsToBounds = YES;
    self.login.backgroundColor = [UIColor colorWithRed:52.0/255 green:162.0/255 blue:44.0/255 alpha:1];
    self.signup.backgroundColor = [UIColor colorWithRed:52.0/255 green:162.0/255 blue:44.0/255 alpha:1];
    self.login.titleLabel.textColor = [UIColor blackColor];
    self.signup.titleLabel.textColor = [UIColor blackColor];
    
}

-(void)handleTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signUpPressed:(id)sender {
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    User *testUser = [delegate.userDatabase.userDatabase objectForKey:self.usernameField.text];
    
    if (self.usernameField.text.length == 0 || self.passwordField.text.length == 0) {
        NSLog(@"No valid credentials presented");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Signup didn't work!" message:@"One of your fields was left blank." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];
        [alert show];
        return;
    }
    
    if (testUser) {
        NSLog(@"this is an existing user");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Signup didn't work!" message:@"This user already exists." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];
        [alert show];
        return;
    } else {
        
    
    delegate.user = [[User alloc] init];
    delegate.user.name = self.usernameField.text;
    delegate.user.password = self.passwordField.text;
        
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
}

- (IBAction)loginPressed:(id)sender {
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    User *testUser = [delegate.userDatabase.userDatabase objectForKey:self.usernameField.text];
    
    
    
    if (self.usernameField.text.length == 0 || self.usernameField.text.length == 0) {
        NSLog(@"No valid credentials presented");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login didn't work!" message:@"One of your fields was left blank." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];
        [alert show];
        return;
    }
    
    if (testUser) {
        NSLog(@"this is an existing user");
        if (![testUser.password isEqualToString:self.passwordField.text]) {
            NSLog(@"incorrect password for user");
        
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login didn't work!" message:@"The password does not match what is on file for that user." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];
            [alert show];
            return;
        } else {
            delegate.user = testUser;
        }
    } else {
        NSLog(@"this is a brand new user");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login didn't work!" message:@"This user does not exist." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];
        [alert show];
        return;
        
    }
     
    delegate.user = testUser;
    
    
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
