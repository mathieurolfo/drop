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
    
    
    UIImage *canImage = [UIImage imageNamed:@"wateringCan.png"];
    UIImage *resizedPlant = [UIImage imageWithCGImage:[canImage CGImage]
                             scale:2 orientation:(canImage.imageOrientation)];
                         
    [self.waterButton setBackgroundImage:resizedPlant forState:UIControlStateNormal];

    self.title = @"Your Plant";
    //UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:delegate action:@selector("menuButtonClicked")];
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:delegate action:@selector(menuButtonClicked)];
    self.navigationItem.leftBarButtonItem = menuButton;

}

- (void)menuButtonClicked {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)waterButtonClicked:(id)sender {
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSLog(@"%f %f", self.plantView.bounds.size.width, self.plantView.bounds.size.height);
    if (delegate.user.currentDrops > 0) {
        delegate.user.currentDrops -= 1;
        delegate.user.dropsWatered += 1;
    }
    if (delegate.user.dropsWatered > 0 && delegate.user.dropsWatered <= 5) {
        self.plantView.image = [UIImage imageNamed:@"plantB.png"];
    }
    
    else if (delegate.user.dropsWatered > 5 && delegate.user.dropsWatered <= 10) {
        self.plantView.image = [UIImage imageNamed:@"plantC.png"];
    }
    
    self.currentDrops.text = [NSString stringWithFormat:@"Current Drops: %d", delegate.user.currentDrops];
    [self.view setNeedsDisplay];
    NSLog(@"%f %f", self.plantView.bounds.size.width, self.plantView.bounds.size.height);
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
