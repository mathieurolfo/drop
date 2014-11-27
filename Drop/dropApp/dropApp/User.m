//
//  User.m
//  dropApp
//
//  Created by Mathieu Rolfo on 11/19/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import "User.h"

@implementation User

/*
 This is the initialization of the user's properties. 
 */
-(id)init {
    if(self = [super init]) {
        _currentDrops = 10;
        _lifetimeDrops = _currentDrops;
        _pinnedTasks = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
