//
//  User.h
//  Task Manager 0
//
//  Created by GrepRuby1 on 05/09/16.
//  Copyright © 2016 GrepRuby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

- (id) initWithName : (NSString *)name username : (NSString *)username password :(NSString *)password email : (NSString *)email;
- (NSString *) getName;
- (NSString *) getUsername;
- (NSString *) getPassword;
- (NSString *) getEmail;
- (NSMutableArray *) getTasks;
- (void) addTask : (Task *)task;
- (void) editTask : (Task *)task atPosition : (int)atPosition;
- (void) initTasks;

@end
