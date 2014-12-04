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

        _currentDrops = 0;
        _lifetimeDrops = _currentDrops;
        _pinnedTasks = [[NSMutableArray alloc] init];
        _completedTasks = [[NSMutableArray alloc] init];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _currentDrops = [aDecoder decodeIntForKey:@"currentDrops"];
        _lifetimeDrops = [aDecoder decodeIntForKey:@"lifetimeDrops"];
        _pinnedTasks = [aDecoder decodeObjectForKey:@"pinnedTasks"];
        _completedTasks = [aDecoder decodeObjectForKey:@"completedTasks"];
        _name = [aDecoder decodeObjectForKey:@"name"];
        _password = [aDecoder decodeObjectForKey:@"password"];
        _dropsWatered = [aDecoder decodeIntForKey:@"dropsWatered"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInt:self.currentDrops forKey:@"currentDrops"];
    [aCoder encodeInt:self.lifetimeDrops forKey:@"lifetimeDrops"];
    [aCoder encodeObject:self.pinnedTasks forKey:@"pinnedTasks"];
    [aCoder encodeObject:self.completedTasks forKey:@"completedTasks"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.password forKey:@"password"];
    [aCoder encodeInt:self.dropsWatered forKey:@"dropsWatered"];
}

@end
