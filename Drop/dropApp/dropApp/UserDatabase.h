//
//  UserDatabase.h
//  dropApp
//
//  Created by Mathieu Rolfo on 11/30/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface UserDatabase : NSObject
@property (strong, nonatomic) User *user;
-(BOOL)saveChanges;
@end
