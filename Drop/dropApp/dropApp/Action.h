//
//  Action.h
//  dropApp
//
//  Created by Mathieu Rolfo on 11/20/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Action : NSObject <NSCoding>

@property (nonatomic, strong) NSString *name;
@property (nonatomic) int dropValue;
@property (nonatomic, strong) NSDate *dateAdded;

@end
