//
//  SecoundViewController.h
//  Task Manager 0
//
//  Created by GrepRuby1 on 31/08/16.
//  Copyright © 2016 GrepRuby. All rights reserved.
//




#import "DisplayViewController.h"


@protocol senddataProtocol <NSObject>

-(void)sendDataToDisplayViewController: (Task *) task;


@end

@interface AddViewController : UIViewController

@property(nonatomic,assign)id delegate;
@property Task* all;

@end
