//
//  User.h
//  dropApp
//
//  Created by Mathieu Rolfo on 11/19/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic) NSString* username;
@property (nonatomic) NSString* password; // we aren't worried about security so keep in plaintext

@property (nonatomic) int currentDrops; // +1 each login; more for completed tasks
@property (nonatomic) int lifetimeDrops; // incremented with all completed tasks
@property (nonatomic) int dropsWatered; // incremented for each click of watering can

// NSMutableSet for ease of checking membership and ability to add/subtract
@property (nonatomic) NSMutableSet* pinnedActions;
@property (nonatomic) NSMutableSet* completedActions;

@end