//
//  UserTaskCell.m
//  dropApp
//
//  Created by Mathieu Rolfo on 11/27/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import "UserTaskCell.h"

@implementation UserTaskCell

- (void)awakeFromNib {
    // Initialization code
}
- (IBAction)buttonClicked:(id)sender {
    [self.delegate didCompleteTaskAtIndex:self.cellIndex];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
