//
//  SecoundViewController.m
//  Task Manager 0
//
//  Created by GrepRuby1 on 31/08/16.
//  Copyright © 2016 GrepRuby. All rights reserved.
//

#import "AddViewController.h"
#import "DisplayViewController.h"

@interface AddViewController () {
    BOOL edit;
    Task *taskToEdit;
}
@property (weak, nonatomic) IBOutlet UITextField *taskTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *timeRequiredTextField;
@property (weak, nonatomic) IBOutlet UIButton *addEditButton;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if(edit == YES) {
        self.taskTextField.text = taskToEdit.task;
        self.descriptionTextField.text = taskToEdit.descriptionOfTask;
        self.timeRequiredTextField.text = taskToEdit.timeOfTask;
        [self.addEditButton setTitle : @"Edit" forState : UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)cancelButtonClicked : (id)sender {
    [[self navigationController] popViewControllerAnimated : YES];
}

- (IBAction)add : (id)sender {
    Task *data;
    if(edit == YES) {
        if(self.descriptionTextField.text.length < 1 || self.taskTextField.text.length < 1|| self.timeRequiredTextField.text.length < 1) {
            [self showAlert];
        }
        else {
            edit = NO;
            data = [[Task alloc]initWithTask : self.taskTextField.text descriptionOfTask : self.descriptionTextField.text timeOfTask : self.timeRequiredTextField.text];
            [self.delegate sendEditedDataToDisplayViewController : data];
            [[self navigationController] popViewControllerAnimated : YES];
        }
    }
    else {
        if(self.descriptionTextField.text.length < 1 || self.taskTextField.text.length < 1 || self.timeRequiredTextField.text.length < 1) {
            [self showAlert];
        }
        else {
            data = [[Task alloc]initWithTask : self.taskTextField.text descriptionOfTask : self.descriptionTextField.text timeOfTask : self.timeRequiredTextField.text];
            data.task = self.taskTextField.text;
            data.descriptionOfTask = self.descriptionTextField.text;
            data.timeOfTask = self.timeRequiredTextField.text;
            [self.delegate sendDataToDisplayViewController : data];
            [[self navigationController] popViewControllerAnimated : YES];
        }
    }
}

- (void)editTask : (Task *)task {
    edit = YES;
    taskToEdit = task;
}

- (void)showAlert {
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle : errorTitle
                                message : emptyFieldErrorMessage
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
@end
