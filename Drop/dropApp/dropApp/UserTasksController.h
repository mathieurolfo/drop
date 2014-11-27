//
//  UserTasksController.h
//  dropApp
//
//  Created by Mathieu Rolfo on 11/23/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserTaskCell.h"

@interface UserTasksController : UIViewController <UITableViewDataSource, UITableViewDelegate, UserTaskCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
