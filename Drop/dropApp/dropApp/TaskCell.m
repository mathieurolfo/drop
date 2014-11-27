//
//  TaskCell.m
//
//  Created by Mathieu Rolfo on 11/26/14.
//

#import "TaskCell.h"
#import "AppDelegate.h"
#import "Action.h"

@implementation TaskCell

- (void)awakeFromNib {
    // Initialization code
}
- (IBAction)buttonClicked:(id)sender {
    NSLog(@"button clicked, code inside taskCell, at index %d, %@", self.cellIndex, self.delegate);
    [self.delegate didPinTaskAtIndex:self.cellIndex];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
