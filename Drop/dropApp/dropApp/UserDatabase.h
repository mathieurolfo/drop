//
//  UserDatabase.h
//  dropApp
//
//  Created by Mathieu Rolfo on 11/30/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDatabase : NSObject
@property (strong, nonatomic) NSMutableDictionary *userDatabase;
-(BOOL)saveChanges;
@end
