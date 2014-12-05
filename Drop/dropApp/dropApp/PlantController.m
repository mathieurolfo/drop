//
//  PlantController.m
//  dropApp
//
//  Created by Mathieu Rolfo on 11/19/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import "PlantController.h"
#import "AppDelegate.h"
#import "CMPopTipView.h"

@interface PlantController ()

@property (nonatomic) int *plantLevelArray;
@property (strong, nonatomic) NSArray *plantImagesArray;

@end

@implementation PlantController

-(instancetype)init {
    self = [super init];
    
    
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
    
    UIImage *hamburgerIcon = [UIImage imageNamed:@"hamburger.png"];
    UIImage *resizedHam = [UIImage imageWithCGImage:[hamburgerIcon CGImage]
                                                scale:55.0/(hamburgerIcon.scale) orientation:(hamburgerIcon.imageOrientation)];
    
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:resizedHam style:UIBarButtonItemStylePlain  target:delegate action:@selector(menuButtonClicked)];
    menuButton.tintColor = [UIColor colorWithRed:0 green:88.0/255 blue:38.0/255 alpha:1];
    self.navigationItem.leftBarButtonItem = menuButton;
    
    [self performSelector:@selector(checkNeedsTutorial) withObject:nil afterDelay:0.75f];
    [self setPlantText];
    
    

}

-(void) setPlantText {
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    int drops = delegate.user.dropsWatered;
    if (drops < 1) {
        self.plantInfoLabel.text = [NSString stringWithFormat:@"%d drop until level up", 1-drops];
    } else if (drops < 5) {
        self.plantInfoLabel.text = [NSString stringWithFormat:@"%d drops until level up", 5-drops];
    } else if (drops < 15){
        self.plantInfoLabel.text = [NSString stringWithFormat:@"%d drops until level up", 15-drops];
    } else if (drops < 40) {
        self.plantInfoLabel.text = [NSString stringWithFormat:@"%d drops until level up", 40-drops];
    } else {
        self.plantInfoLabel.text = [NSString stringWithFormat:@"plant maxed out"];
    }

    
}

-(UIImage *)getPlantImage {
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    int drops = delegate.user.dropsWatered;
    if (drops < 1) {
        return [UIImage imageNamed:@"plantA.png"];
    } else if (drops < 5) {
        return [UIImage imageNamed:@"plantB.png"];
    } else if (drops < 15){
        return [UIImage imageNamed:@"plantC.png"];
    } else if (drops < 40) {
         return [UIImage imageNamed:@"plantD.png"];
    } else {
        return [UIImage imageNamed:@"plantE.png"];
    }
}

-(void)checkNeedsTutorial {
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    if (delegate.user.lifetimeDrops == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Welcome!" message:@"Complete a quick tutorial to get your first couple drops." delegate:self cancelButtonTitle:nil otherButtonTitles:@"Show me around", nil];
        [alert show];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self completeTutorial];
    }
}

-(void)popTipViewWasDismissedByUser:(CMPopTipView *)popTipView
{
    
}

-(void)completeTutorial {
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    float startDelay = 0.6;
    float displayTime = 3.0;
    [self performSelector:@selector(firstPop) withObject:nil afterDelay:startDelay];
    [self performSelector:@selector(secondPop) withObject:nil afterDelay:displayTime+2*startDelay-0.1];
    
    [self performSelector:@selector(thirdPop) withObject:nil afterDelay:2*displayTime+3*startDelay-0.1];
    
    [self performSelector:@selector(fourthPop) withObject:nil afterDelay:3*displayTime+4*startDelay];
    [self performSelector:@selector(fifthPop) withObject:nil afterDelay:4*displayTime+6*startDelay];
    if (delegate.user.lifetimeDrops == 0) {
        [self performSelector:@selector(rewardDrops) withObject:nil afterDelay:5*displayTime+8*startDelay];
    }
    
}

-(void)rewardDrops {
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    delegate.user.currentDrops += 3;
    delegate.user.lifetimeDrops += 3;
    self.currentDrops.text = [NSString stringWithFormat:@"Current Drops: %d", delegate.user.currentDrops];
    [self.view setNeedsDisplay];
}

-(void)firstPop {
    NSString *message = @"Here is your plant.";
    CMPopTipView *popTipView1 = [[CMPopTipView alloc] initWithMessage:message];
    popTipView1.backgroundColor = [UIColor colorWithRed:0 green:88.0/255 blue:38.0/255 alpha:1];
    popTipView1.delegate = self;
    popTipView1.has3DStyle = NO;
    popTipView1.borderColor = [UIColor colorWithRed:0 green:88.0/255 blue:38.0/255 alpha:1];
    popTipView1.hasGradientBackground = NO;
    [popTipView1 presentPointingAtView:self.plantView inView:self.view animated:YES];
    [self performSelector:@selector(dismissPopView:) withObject:popTipView1 afterDelay:2.5];
}

-(void)secondPop {
    NSString *message = @"Water your plant by clicking on the watering can, and watch it grow!";
    CMPopTipView *popTipView2 = [[CMPopTipView alloc] initWithMessage:message];
    popTipView2.delegate = self;
    popTipView2.backgroundColor = [UIColor colorWithRed:0 green:88.0/255 blue:38.0/255 alpha:1];
    popTipView2.hasGradientBackground = NO;
    popTipView2.borderColor = [UIColor colorWithRed:0 green:88.0/255 blue:38.0/255 alpha:1];
    popTipView2.hasGradientBackground = NO;
    popTipView2.has3DStyle = NO;
    [popTipView2 presentPointingAtView:self.waterButton inView:self.view animated:YES];
    [self performSelector:@selector(dismissPopView:) withObject:popTipView2 afterDelay:2.5];

}

-(void)thirdPop {
    NSString *message = @"Get more drops for your plant by completing real-world water saving actions.";
    CMPopTipView *popTipView2 = [[CMPopTipView alloc] initWithMessage:message];
    popTipView2.delegate = self;
    popTipView2.backgroundColor = [UIColor colorWithRed:0 green:88.0/255 blue:38.0/255 alpha:1];
    popTipView2.borderColor = [UIColor colorWithRed:0 green:88.0/255 blue:38.0/255 alpha:1];
    popTipView2.hasGradientBackground = NO;
    popTipView2.has3DStyle = NO;
    [popTipView2 presentPointingAtView:self.barButtonLabel inView:self.view animated:YES];
    [self performSelector:@selector(dismissPopView:) withObject:popTipView2 afterDelay:2.5];

}

-(void)fourthPop {
    NSString *message = @"Have fun growing your plant and saving water in the process!";
    CMPopTipView *popTipView2 = [[CMPopTipView alloc] initWithMessage:message];
    popTipView2.delegate = self;
    popTipView2.backgroundColor = [UIColor colorWithRed:0 green:88.0/255 blue:38.0/255 alpha:1];
    popTipView2.borderColor = [UIColor colorWithRed:0 green:88.0/255 blue:38.0/255 alpha:1];
    popTipView2.hasGradientBackground = NO;
    popTipView2.has3DStyle = NO;
    [popTipView2 presentPointingAtView:self.currentDrops inView:self.view animated:YES];
    [self performSelector:@selector(dismissPopView:) withObject:popTipView2 afterDelay:2.5];
}

-(void)fifthPop {
    
    NSString *message = @"You can always replay this tutorial by clicking the option in the side menu.";
    CMPopTipView *popTipView2 = [[CMPopTipView alloc] initWithMessage:message];
    popTipView2.delegate = self;
    popTipView2.backgroundColor = [UIColor colorWithRed:0 green:88.0/255 blue:38.0/255 alpha:1];
    popTipView2.borderColor = [UIColor colorWithRed:0 green:88.0/255 blue:38.0/255 alpha:1];
    popTipView2.hasGradientBackground = NO;
    popTipView2.has3DStyle = NO;
    [popTipView2 presentPointingAtBarButtonItem:self.navigationItem.leftBarButtonItem animated:YES];
    [self performSelector:@selector(dismissPopView:) withObject:popTipView2 afterDelay:2.5];
}

-(void)dismissPopView: (CMPopTipView *)pop {
    [pop dismissAnimated:YES];
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
    [self setPlantText];
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
