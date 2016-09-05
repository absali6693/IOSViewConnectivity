//
//  SignUpViewController.m
//  Task Manager 0
//
//  Created by GrepRuby1 on 05/09/16.
//  Copyright © 2016 GrepRuby. All rights reserved.
//

#import "SignUpViewController.h"
#import "DisplayViewController.h"

@interface SignUpViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;


@end

@implementation SignUpViewController{
    NSMutableArray *userDataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signUpClicked : (id)sender {
    if([self isValidEntry]) {
        User *user = [[User alloc] initWithName : self.nameTextField.text username : self.usernameTextField.text password : self.passwordTextField.text email : self.emailTextField.text];
        [self.delegate sendUserToSignInViewController : user];
    }
    else {
        UIAlertController *alert = [UIAlertController
                                    alertControllerWithTitle : errorTitle
                                    message : userAlreadyExist
                                    preferredStyle : UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction
                             actionWithTitle : @"OK"
                             style : UIAlertActionStyleDefault
                             handler : ^(UIAlertAction *action) {
                                 [alert dismissViewControllerAnimated : YES completion : nil];
                                 
                             }];
        [alert addAction : ok];
        [self presentViewController : alert animated : YES completion : nil];
    }
}

- (void)sendUserData : (NSMutableArray *)data {
    userDataArray = data;
}

- (BOOL)isValidEntry {
    for (id user in userDataArray) {
        if([user getUsername] == self.usernameTextField.text) {
            return NO;
        }
    }
    return YES;
}

@end
