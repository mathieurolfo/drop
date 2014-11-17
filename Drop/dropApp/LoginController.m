//
//  LoginController.m
//  dropApp
//
//  Created by Mathieu Rolfo on 11/16/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import "LoginController.h"
#import "AppDelegate.h"
#import "HomeControllerViewController.h"

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
    HomeControllerViewController *homeController = [[HomeControllerViewController alloc] init];
    delegate.homeController = homeController;
    [delegate.drawer setCenterViewController:homeController];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
