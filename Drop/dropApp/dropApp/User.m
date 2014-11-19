//
//  User.m
//  dropApp
//
//  Created by Mathieu Rolfo on 11/19/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import "User.h"

@implementation User

-(id)init {
    if(self = [super init]) {
        _lifetimeDrops = 1;
        _currentDrops = 1;
    }
    return self;
}

@end
