//
//  DataController.m
//  Task Manager 0
//
//  Created by GrepRuby1 on 31/08/16.
//  Copyright © 2016 GrepRuby. All rights reserved.
//

#import "Task.h"

@implementation Task : NSObject

- (id) initWithTask : (NSString *)task descriptionOfTask : (NSString *)descriptionOfTask timeOfTask : (NSString *)timeOfTask {
    self = [super init];
    if (self) {
        self.task = task;
        self.descriptionOfTask = descriptionOfTask;
        self.timeOfTask = timeOfTask;
    }
    return self;
}

- (id) init {
    return [self initWithTask : nil descriptionOfTask : nil timeOfTask : nil];
}

@end
