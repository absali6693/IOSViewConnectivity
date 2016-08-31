//
//  SecoundViewController.m
//  Task Manager 0
//
//  Created by GrepRuby1 on 31/08/16.
//  Copyright © 2016 GrepRuby. All rights reserved.
//

#import "AddViewController.h"

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

-(void)viewWillDisappear:(BOOL)animated
{
    
}


- (IBAction)cancelButtonClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}


- (IBAction)add:(id)sender {
    Task *data = [[Task alloc]init];
    data.task = self.taskField.text;
    data.descriptionOfTask = self.descriptionField.text;
    data.timeOfTask = self.timeRequiredField.text;
    [self.delegate sendDataToDisplayViewController:data];
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
