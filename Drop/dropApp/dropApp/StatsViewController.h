//
//  StatsViewController.h
//  dropApp
//
//  Created by Mathieu Rolfo on 12/4/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentDropsLabel;
@property (weak, nonatomic) IBOutlet UILabel *lifetimeDropsLabel;

@property (weak, nonatomic) IBOutlet UITextView *messageText;

@end
