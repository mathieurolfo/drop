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
    action1.dropValue = 12;
    [tasksArray addObject:action1];
    
    Action *action2 = [[Action alloc] init];
    action2.name = @"Run Cold Wash Cycle";
    action2.dropValue = 1;
    [tasksArray addObject:action2];
    
    Action *action3 = [[Action alloc] init];
    action3.name = @"Check Piping for Leaks";
    action3.dropValue = 2;
    [tasksArray addObject:action2];
    
    Action *action4 = [[Action alloc] init];
    action4.name = @"Run Dishwasher When Full";
    action4.dropValue = 1;
    [tasksArray addObject:action4];

    Action *action5 = [[Action alloc] init];
    action5.name = @"Water Lawn at Night";
    action5.dropValue = 2;
    [tasksArray addObject:action5];

    Action *action = [[Action alloc] init];
    action.name = @"Install Faucet Aerator";
    action.dropValue = 5;
    [tasksArray addObject:action];

    action = [[Action alloc] init];
    action.name = @"Read your Water Bill";
    action.dropValue = 3;
    [tasksArray addObject:action];

    action = [[Action alloc] init];
    action.name = @"Skip a Shower";
    action.dropValue = 2;
    [tasksArray addObject:action];

    action = [[Action alloc] init];
    action.name = @"Aerate your Lawn";
    action.dropValue = 4;
    [tasksArray addObject:action];

    action = [[Action alloc] init];
    action.name = @"Reuse a Towel";
    action.dropValue = 1;
    [tasksArray addObject:action];

    action = [[Action alloc] init];
    action.name = @"Buy Efficient Washer/Dryer";
    action.dropValue = 40;
    [tasksArray addObject:action];

    action = [[Action alloc] init];
    action.name = @"Set a monthly usage goal";
    action.dropValue = 3;
    [tasksArray addObject:action];

    
    return (NSArray *)tasksArray;
    
}


@end
