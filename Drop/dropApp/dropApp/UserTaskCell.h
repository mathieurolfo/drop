//
//  UserTaskCell.h
//  dropApp
//
//  Created by Mathieu Rolfo on 11/27/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol UserTaskCellDelegate <NSObject>

-(void)didCompleteTaskAtIndex:(NSInteger)cellIndex;

@end

@interface UserTaskCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dropLabel;
@property (weak, nonatomic) IBOutlet UIButton *completeTaskButton;
-(IBAction)buttonClicked:(id)sender;
@property (weak, nonatomic) id<UserTaskCellDelegate> delegate;
@property (assign, nonatomic) NSInteger cellIndex;



@end
