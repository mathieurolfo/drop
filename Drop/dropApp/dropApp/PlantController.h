//
//  PlantController.h
//  dropApp
//
//  Created by Mathieu Rolfo on 11/19/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import "CMPopTipView.h"
#import <UIKit/UIKit.h>

@interface PlantController : UIViewController <UIAlertViewDelegate, CMPopTipViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *currentDrops;
@property (weak, nonatomic) IBOutlet UIImageView *plantView;
@property (weak, nonatomic) IBOutlet UIButton *waterButton;
@property (weak, nonatomic) IBOutlet UILabel *plantInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *barButtonLabel;

-(void)refreshScreen;
-(void) setPlantText;
-(void) completeTutorial;

@end

