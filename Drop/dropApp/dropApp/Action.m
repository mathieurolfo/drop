//
//  Action.m
//  dropApp
//
//  Created by Mathieu Rolfo on 11/20/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import "Action.h"

@implementation Action

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _dateAdded = [aDecoder decodeObjectForKey:@"dateAdded"];
        _dropValue = [aDecoder decodeIntForKey:@"dropValue"];
        _name = [aDecoder decodeObjectForKey:@"name"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.dateAdded forKey:@"dateAdded"];
    [aCoder encodeInt:self.dropValue forKey:@"dropValue"];
}

@end
