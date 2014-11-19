//
//  PlantController.m
//  dropApp
//
//  Created by Mathieu Rolfo on 11/19/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import "PlantController.h"
#import "AppDelegate.h"

@interface PlantController ()

@end

@implementation PlantController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    UIImage *image = [UIImage imageNamed:@"plantA.png"];
    [self.plantView setImage:image];
    
    self.currentDrops.text = [NSString stringWithFormat:@"Current Drops: %d", delegate.user.currentDrops];
    self.lifetimeDrops.text = [NSString stringWithFormat:@"Lifetime Drops: %d", delegate.user.lifetimeDrops];
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
