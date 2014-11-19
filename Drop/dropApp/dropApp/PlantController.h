//
//  PlantController.h
//  dropApp
//
//  Created by Mathieu Rolfo on 11/19/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlantController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *currentDrops;
@property (weak, nonatomic) IBOutlet UILabel *lifetimeDrops;
@property (weak, nonatomic) IBOutlet UIImageView *plantView;

@end
