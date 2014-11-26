//
//  TaskDatabaseController.h
//  dropApp
//
//  Created by Mathieu Rolfo on 11/26/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskDatabaseController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) NSArray *tasksArray;


@end
