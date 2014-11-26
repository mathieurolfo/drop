//
//  Initializer Data.m
//  dropApp
//
//  Created by Kelsey Josund on 11/20/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import "Initializer Data.h"

@implementation Initializer_Data

- (void) init_fn {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]initWithCapacity:10]; // creating a dictionary
    
    // create the four users
    User* user_one = [[User alloc] init];
    User* user_two = [[User alloc] init];
    User* user_three = [[User alloc] init];
    
    // set up properties of users
    user_one.username = @"Kelsey";
    user_one.password = @"pwtest1";
    user_one.currentDrops = 5;
    user_one.lifetimeDrops = 15;
    user_one.dropsWatered = 0; // plant in start state
    
    user_two.username = @"Matt";
    user_two.password = @"pwtest1";
    user_two.currentDrops = 5;
    user_two.lifetimeDrops = 15;
    user_two.dropsWatered = 6; // plant partially grown
    
    user_three.username = @"Megan";
    user_three.password = @"pwtest1";
    user_three.currentDrops = 5;
    user_three.lifetimeDrops = 20;
    user_three.dropsWatered = 15; // plant quite grown
  
    // add users to dictionary
    [dict setObject: user_one forKey:@"one"];
    [dict setObject: user_two forKey:@"two"];
    [dict setObject: user_three forKey:@"three"];
    
    NSLog(@"%@", dict); // print the object for error checking (%@ is format specifier)
}

@end