//
//  ViewController.m
//  Task Manager 0
//
//  Created by GrepRuby1 on 31/08/16.
//  Copyright © 2016 GrepRuby. All rights reserved.
//

#import "DisplayViewController.h"

@interface DisplayViewController ()
@property (weak, nonatomic) IBOutlet UILabel *taskLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


@end

@implementation DisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"pressed");
    if([segue.identifier isEqualToString:addSegue]){
        AddViewController *d = segue.destinationViewController;
        d.delegate=self;
        
    }
}

-(void)sendDataToDisplayViewController:(Task *)task
{
    Task *data = task;//[[DataController alloc] init];

     self.taskLabel.text= data.task;
     self.descriptionLabel.text = data.descriptionOfTask;
      self.timeLabel.text = data.timeOfTask;
}

@end
