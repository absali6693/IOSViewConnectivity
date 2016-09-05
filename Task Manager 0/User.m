//
//  User.m
//  Task Manager 0
//
//  Created by GrepRuby1 on 05/09/16.
//  Copyright © 2016 GrepRuby. All rights reserved.
//

#import "User.h"


@implementation User{
    NSString *name;
    NSString *username;
    NSString *password;
    NSString *email;
    NSMutableArray *taskDataArray;
}

- (id) initWithName : (NSString *)nameToAdd username : (NSString *)usernameToAdd password : (NSString *)passwordToAdd email : (NSString *)emailToAdd {
    self = [super init];
    if (self) {
        name = nameToAdd;
        username = usernameToAdd;
        password = passwordToAdd;
        email = emailToAdd;
    }
    return self;
}

- (id) init {
    return [self initWithName : nil username : nil password :nil email : nil];
}

- (NSString *) getName {
    return name;
}

- (NSString *) getUsername {
    return  username;
}

- (NSString *) getPassword {
    return  password;
}

- (NSString *) getEmail {
    return email;
}

- (NSMutableArray *) getTasks {
    return taskDataArray;
}

- (void) addTask : (Task *)task {
    [taskDataArray addObject : task];
}

- (void) editTask : (Task *)task atPosition : (int)atPosition {
    [taskDataArray replaceObjectAtIndex : atPosition withObject : task];
}

- (void) initTasks {
    taskDataArray = [[NSMutableArray alloc] init];
}

@end
