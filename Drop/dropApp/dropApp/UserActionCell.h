//
//  UserActionCell.h
//  dropApp
//
//  Created by Mathieu Rolfo on 11/30/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UserActionCellDelegate <NSObject>

-(void)didCompleteTaskAtIndex:(NSInteger)cellIndex;
-(void)didRemoveTaskAtIndex:(NSInteger)cellIndex;

@end

@interface UserActionCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *completeTaskButton;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dropLabel;


@property (weak, nonatomic) id<UserActionCellDelegate                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           > delegate;
@property (assign, nonatomic) NSInteger cellIndex;


@end
