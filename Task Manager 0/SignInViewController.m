//
//  SignUpSignInViewController.m
//  Task Manager 0
//
//  Created by GrepRuby1 on 05/09/16.
//  Copyright © 2016 GrepRuby. All rights reserved.
//

#import "SignInViewController.h"
#import "SignUpViewController.h"
#import "DisplayViewController.h"

@interface SignInViewController () {
    NSMutableArray *userDataArray;
}

@property (weak, nonatomic) IBOutlet UITextField *usernameLabel;
@property (weak, nonatomic) IBOutlet UITextField *passwordLabel;

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    self.usernameLabel.text = @"";
    self.passwordLabel.text = @"";
}

- (IBAction)logInButton : (id)sender {
    for (id user in userDataArray) {
        if([user getUsername] == self.usernameLabel.text && [user getPassword] == self.passwordLabel.text) {
            UIStoryboard *targetStoryBoard = [UIStoryboard storyboardWithName : mainStoryBoard bundle : nil];
            DisplayViewController *displayController = [targetStoryBoard instantiateViewControllerWithIdentifier : displayViewController];
            [displayController setUserData : user];
            [self.navigationController pushViewController : displayController animated : YES];
        }
    }
    
}

- (IBAction)signUpButton : (id)sender {
    SignUpViewController *signUpViewController = [self.storyboard instantiateViewControllerWithIdentifier : signUpController];
    signUpViewController.delegate = self;
    signUpViewController.title = @"Sign Up";
    [signUpViewController sendUserData : userDataArray];
    [self.navigationController pushViewController : signUpViewController animated : YES];
    
    
}

- (void)sendUserToSignInViewController : (User *)user {
    if(userDataArray == nil) {
        userDataArray = [[NSMutableArray alloc] init];
    }
    [userDataArray addObject : user];
    UIStoryboard *targetStoryBoard = [UIStoryboard storyboardWithName : mainStoryBoard bundle : nil];
    DisplayViewController *displayController = [targetStoryBoard instantiateViewControllerWithIdentifier : displayViewController];
    [displayController setUserData:user];
    [self.navigationController pushViewController : displayController animated : YES];
}



@end
