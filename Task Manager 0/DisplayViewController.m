//
//  ViewController.m
//  Task Manager 0
//
//  Created by GrepRuby1 on 31/08/16.
//  Copyright © 2016 GrepRuby. All rights reserved.
//

#import "DisplayViewController.h"
#import "TableCellPrototype.h"
#import "AddViewController.h"

@interface DisplayViewController () <UITableViewDataSource,UITableViewDelegate> {
    NSMutableArray *taskDataArray;
}

@property (weak, nonatomic) IBOutlet UITableView *TableviewContainer;

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

- (NSInteger)tableView : (UITableView *)tableView numberOfRowsInSection : (NSInteger)section {
    return taskDataArray.count;
}

- (UITableViewCell *)tableView : (UITableView *)tableView cellForRowAtIndexPath : (NSIndexPath *)indexPath {
    TableCellPrototype *cell = (TableCellPrototype *)[tableView dequeueReusableCellWithIdentifier : cellPrototype];
    if(cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed : cellPrototype owner : self options : nil];
        cell = [nib objectAtIndex : 0];
    }
    int row = (int)[indexPath row];
    Task *task = [taskDataArray objectAtIndex : row];
    cell.task.text = task.task;
    cell.descriptionForTask.text = task.descriptionOfTask;
    cell.timeRequired.text = task.timeOfTask;
    cell.deleteTheTaskButton.tag = indexPath.row;
    [cell.deleteTheTaskButton addTarget : self action : @selector(deleteTaskClick :) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)tableView : (UITableView *)tableView didSelectRowAtIndexPath : (NSIndexPath *)indexPath {
    
}

- (void) prepareForSegue : (UIStoryboardSegue *)segue sender : (id)sender {
    if([segue.identifier isEqualToString : addSegue]){
        AddViewController *addViewController = segue.destinationViewController;
        addViewController.delegate = self;
    }
}

- (void)sendDataToDisplayViewController : (Task *)task {
    if(taskDataArray == nil){
        taskDataArray = [[NSMutableArray alloc] init];
    }
    [taskDataArray addObject : task];
    [self.TableviewContainer reloadData];
}

- (IBAction)deleteTaskClick : (id)sender {
    UIButton *senderButton = (UIButton*) sender;
    int index = (int)senderButton.tag;
    [taskDataArray removeObjectAtIndex : index];
    [self.TableviewContainer reloadData];
}

@end
