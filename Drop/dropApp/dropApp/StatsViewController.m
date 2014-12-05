//
//  StatsViewController.m
//  dropApp
//
//  Created by Mathieu Rolfo on 12/4/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import "StatsViewController.h"
#import "AppDelegate.h"
@interface StatsViewController ()

@end

@implementation StatsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Stats";
    
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    // Do any additional setup after loading the view from its nib.
    self.usernameLabel.text = [NSString stringWithFormat:@"Hello, %@.", delegate.user.name];
    self.currentDropsLabel.text = [NSString stringWithFormat:@"You currently have %d drops.", delegate.user.currentDrops];
    self.lifetimeDropsLabel.text = [NSString stringWithFormat:@"You have earned a total of %d drops.", delegate.user.lifetimeDrops];
    if (delegate.user.lifetimeDrops < 20) {
        self.messageText.text = @"You are just beginning your water saving quest. Keep completing tasks to grow your plant and develop eco-friendly habits!";
    } else if (delegate.user.lifetimeDrops < 40) {
        self.messageText.text = @"Wow! You're off to a great start. Keep up the good work: your plant and your water bill will thank you.";
    } else {
        self.messageText.text = @"My goodness! Your plant is fully grown. But don't let that stop you from keeping up the sustainable lifestyle.";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
