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

@property (strong, nonatomic) NSArray *plantLevelArray;
@property (strong, nonatomic) NSArray *plantImagesArray;

@end

@implementation PlantController

-(instancetype)init {
    self = [super init];
    if (self) {
        self.plantLevelArray = [NSArray arrayWithObjects:0, 1, 5, nil];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    UIImage *image = [self getPlantImage];
    [self.plantView setImage:image];
    
    self.currentDrops.text = [NSString stringWithFormat:@"Current Drops: %d", delegate.user.currentDrops];
    
    UIImage *canImage = [UIImage imageNamed:@"wateringCan.png"];
    UIImage *resizedPlant = [UIImage imageWithCGImage:[canImage CGImage]
                             scale:2 orientation:(canImage.imageOrientation)];
                         
    [self.waterButton setBackgroundImage:resizedPlant forState:UIControlStateNormal];

    self.title = @"Your Plant";
    
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:delegate action:@selector(menuButtonClicked)];
    self.navigationItem.leftBarButtonItem = menuButton;

}

-(UIImage *)getPlantImage {
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    int drops = delegate.user.dropsWatered;
    if (drops < 1) {
        return [UIImage imageNamed:@"plantA.png"];
    } else if (drops < 5) {
        return [UIImage imageNamed:@"plantB.png"];
    } else {
        return [UIImage imageNamed:@"plantC.png"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)waterButtonClicked:(id)sender {
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    if (delegate.user.currentDrops > 0) {
        delegate.user.currentDrops -= 1;
        delegate.user.dropsWatered += 1;
    }
    
    
    self.plantView.image = [self getPlantImage];
    
    self.currentDrops.text = [NSString stringWithFormat:@"Current Drops: %d", delegate.user.currentDrops];
    [self.view setNeedsDisplay];
    
}

-(void)refreshScreen {
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    self.currentDrops.text = [NSString stringWithFormat:@"Current Drops: %d", delegate.user.currentDrops];
    NSLog(@"refreshScreen");
    [self.view setNeedsDisplay];
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
