//
//  DataController.h
//  Task Manager 0
//
//  Created by GrepRuby1 on 31/08/16.
//  Copyright © 2016 GrepRuby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

@property (nonatomic, strong) NSString *task;
@property (nonatomic, strong) NSString *descriptionOfTask;
@property (nonatomic, strong) NSString *timeOfTask;

- (id) initWithTask : (NSString *)task descriptionOfTask : (NSString *)descriptionOfTask timeOfTask :(NSString *)timeOfTask;

@end
