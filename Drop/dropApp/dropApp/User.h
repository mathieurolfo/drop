//
//  User.h
//  dropApp
//
//  Created by Mathieu Rolfo on 11/19/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject <NSCoding>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *password;
@property (nonatomic) int currentDrops;
@property (nonatomic) int lifetimeDrops;
@property (nonatomic) int dropsWatered;
@property (strong, nonatomic) NSMutableArray *pinnedTasks;
@property (strong, nonatomic) NSMutableArray *completedTasks;

@end
