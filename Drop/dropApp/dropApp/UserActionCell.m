//
//  UserActionCell.m
//  dropApp
//
//  Created by Mathieu Rolfo on 11/30/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import "UserActionCell.h"

@implementation UserActionCell

- (void)awakeFromNib {
    // Initialization code
}

- (IBAction)completeButtonClicked:(id)sender {
    [self.delegate didCompleteTaskAtIndex:self.cellIndex];
}
- (IBAction)deleteButtonClicked:(id)sender {
    [self.delegate didRemoveTaskAtIndex:self.cellIndex];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
