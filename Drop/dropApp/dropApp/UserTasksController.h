//
//  UserTasksController.h
//  dropApp
//
//  Created by Mathieu Rolfo on 11/23/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserActionCell.h"
#import "CMPopTipView.h"

@interface UserTasksController : UIViewController <UITableViewDataSource, UITableViewDelegate, UserActionCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
