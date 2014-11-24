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
        // this needs to respond to the logged in user -- one of the three in Initializer Data!
        // set variables based on data there and login provided at login screen to load one of three states
        // _currentDrops = 10;
        // _lifetimeDrops = _currentDrops;
    }
    NSLog(@"after init currentDrops is %d", _currentDrops);
    return self;
}

@end
