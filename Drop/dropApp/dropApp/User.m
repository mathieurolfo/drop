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
        _currentDrops = 10;
        _lifetimeDrops = _currentDrops;
        // set other variables!
    }
    NSLog(@"after init currentDrops is %d", _currentDrops);
    return self;
}

@end
