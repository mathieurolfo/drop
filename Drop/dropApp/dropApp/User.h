//
//  User.h
//  dropApp
//
//  Created by Mathieu Rolfo on 11/19/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic) int currentDrops;
@property (nonatomic) int lifetimeDrops;
@property (nonatomic) int dropsWatered;

@end