//
//  SecoundViewController.m
//  Task Manager 0
//
//  Created by GrepRuby1 on 31/08/16.
//  Copyright © 2016 GrepRuby. All rights reserved.
//

#import "AddViewController.h"
#import "DisplayViewController.h"

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *taskField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionField;
@property (weak, nonatomic) IBOutlet UITextField *timeRequiredField;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear : (BOOL)animated {
    
}

- (IBAction)cancelButtonClicked : (id)sender {
    [[self navigationController] popViewControllerAnimated : YES];
}

- (IBAction)add : (id)sender {
    Task *data = [[Task alloc]init];
    if(self.descriptionField.text.length < 1 || self.taskField.text.length < 1|| self.timeRequiredField.text.length < 1) {
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle : @"Error"
                                      message : @"Please Fill all the fields."
                                      preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle : @"OK"
                             style:UIAlertActionStyleDefault
                             handler : ^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated : YES completion : nil];
                                 
                             }];
        [alert addAction : ok];
        [self presentViewController : alert animated : YES completion : nil];
    }
    else {
        data.task = self.taskField.text;
        data.descriptionOfTask = self.descriptionField.text;
        data.timeOfTask = self.timeRequiredField.text;
        [self.delegate sendDataToDisplayViewController : data];
        [[self navigationController] popViewControllerAnimated : YES];
    }
}

@end
