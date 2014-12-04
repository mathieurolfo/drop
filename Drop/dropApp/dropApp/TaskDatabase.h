//
//  TaskDatabase.h
//  dropApp
//
//  Created by Mathieu Rolfo on 11/30/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskDatabase : NSObject
@property (nonatomic, strong) NSArray *tasksDatabase;
-(NSArray *)loadDatabase;
@end
