//
//  TaskDatabase.m
//  dropApp
//
//  Created by Mathieu Rolfo on 11/30/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import "TaskDatabase.h"
#import "Action.h"

@implementation TaskDatabase

-(NSArray *)loadDatabase {
    
    NSMutableArray *tasksArray = [[NSMutableArray alloc] init];
    
    Action *action0 = [[Action alloc] init];
    action0.name = @"Take a 5 Minute Shower";
    action0.dropValue = 5;
    [tasksArray addObject:action0];
    
    Action *action1 = [[Action alloc] init];
    action1.name = @"Install Low-flow Showerhead";
    action1.dropValue = 20;
    [tasksArray addObject:action1];
    
    Action *action2 = [[Action alloc] init];
    action2.name = @"Install Eco Toilet";
    action2.dropValue = 15;
    [tasksArray addObject:action2];

    
    return (NSArray *)tasksArray;
    
}


@end
