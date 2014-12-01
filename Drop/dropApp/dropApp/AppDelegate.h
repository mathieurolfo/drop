//
//  AppDelegate.h
//  dropApp
//
//  Created by Mathieu Rolfo on 11/16/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MMDrawerController/MMDrawerController.h>
#import "LoginController.h"
#import "PlantController.h"
#import "User.h"
#import "UserTasksController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MMDrawerController *drawer;
@property (strong, nonatomic) LoginController *login;
@property (strong, nonatomic) PlantController *plantController;
@property (strong, nonatomic) User *user;
@property (strong, nonatomic) UserTasksController *tasksController;
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) UINavigationController *tasksNav;
@property (strong, nonatomic) NSArray *tasksDatabase;

-(void)menuButtonClicked;
-(void)enableDrawerAccess;
-(void)disableDrawerAccess;
@end

