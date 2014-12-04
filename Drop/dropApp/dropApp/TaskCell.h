//
//  TaskCell.h
//  
//
//  Created by Mathieu Rolfo on 11/26/14.
//
//

#import <UIKit/UIKit.h>

@protocol TaskCellDelegate <NSObject>

-(void)didPinTaskAtIndex:(NSInteger)cellIndex;

@end

@interface TaskCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dropLabel;
@property (weak, nonatomic) IBOutlet UIButton *pinTaskButton;
-(IBAction)buttonClicked:(id)sender;
@property (weak, nonatomic) id<TaskCellDelegate> delegate;
@property (assign, nonatomic) NSInteger cellIndex;



@end


