//
//  TaskCell.h
//  dropApp
//
//  Created by Mathieu Rolfo on 11/26/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dropCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *pinTaskButton;

@end
