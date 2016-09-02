//
//  SecoundViewController.h
//  Task Manager 0
//
//  Created by GrepRuby1 on 31/08/16.
//  Copyright © 2016 GrepRuby. All rights reserved.
//



#import <UIKit/UIKit.h>

@protocol SendDataProtocol <NSObject>

- (void)sendDataToDisplayViewController : (Task *)task;
- (void)sendEditedDataToDisplayViewController : (Task *)task;

@end

@interface AddViewController : UIViewController

@property (nonatomic, weak) id delegate;

- (void)editTask : (Task *)task;

@end
