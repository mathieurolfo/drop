//
//  UserDatabase.m
//  dropApp
//
//  Created by Mathieu Rolfo on 11/30/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import "UserDatabase.h"
#import "User.h"
#import "AppDelegate.h"

@implementation UserDatabase

-(instancetype)initPrivate {
    self = [super init];
    if (self) {
        NSString *path = [self itemArchivePath];
        _userDatabase = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        if (!_userDatabase) {
            _userDatabase = [[NSMutableDictionary alloc] init];
        }
    }
    return self;
}

-(NSString *)itemArchivePath {
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories firstObject];
    return [documentDirectory stringByAppendingPathComponent:@"users.archive"];
}

-(BOOL)saveChanges
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    [self.userDatabase setObject:delegate.user forKey:delegate.user.name];

    
    NSString *path = [self itemArchivePath];
    return [NSKeyedArchiver archiveRootObject:self.userDatabase toFile:path];
}

@end
