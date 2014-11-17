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
#import "HomeControllerViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MMDrawerController *drawer;
@property (strong, nonatomic) LoginController *login;
@property (strong, nonatomic) HomeControllerViewController *homeController;

@end

