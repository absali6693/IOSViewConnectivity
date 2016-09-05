//
//  SignUpViewController.h
//  Task Manager 0
//
//  Created by GrepRuby1 on 05/09/16.
//  Copyright © 2016 GrepRuby. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SendUserProtocol <NSObject>

- (void)sendUserToSignInViewController : (User *)user;

@end

@interface SignUpViewController : UIViewController

@property (nonatomic, weak) id delegate;

- (void) sendUserData : (NSMutableArray *)data;

@end
