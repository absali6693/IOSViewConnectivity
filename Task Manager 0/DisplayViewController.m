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
    int indexToBeEdited;
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
    if(cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed : cellPrototype owner : self options : nil];
        cell = [nib objectAtIndex : 0];
    }
    int row = (int)[indexPath row];
    Task *task = [taskDataArray objectAtIndex : row];
    tableView.estimatedRowHeight = 111.0;
    tableView.rowHeight = UITableViewAutomaticDimension;
    cell.taskLabel.text = task.task;
    cell.descriptionForTaskLabel.text = task.descriptionOfTask;
    cell.timeRequiredLabel.text = task.timeOfTask;
    cell.deleteTheTaskButton.tag = indexPath.row;
    cell.editTheTaskButton.tag = indexPath.row;
    [cell.deleteTheTaskButton addTarget : self action : @selector(deleteTaskClick :) forControlEvents : UIControlEventTouchUpInside];
    [cell.editTheTaskButton addTarget : self action : @selector(editTaskClick :) forControlEvents :UIControlEventTouchUpInside];
    return cell;
}

- (void)tableView : (UITableView*)tableView willDisplayCell : (UITableViewCell*)cell forRowAtIndexPath : (NSIndexPath*)indexPath {
    if(indexPath.row % 2 == 0) {
        cell.backgroundColor = [UIColor whiteColor];
    }
    else {
        cell.backgroundColor = [UIColor lightGrayColor];
    }
}

- (void) prepareForSegue : (UIStoryboardSegue *)segue sender : (id)sender {
    if([segue.identifier isEqualToString : addSegue]) {
        AddViewController *addViewController = segue.destinationViewController;
        addViewController.delegate = self;
    }
}

- (void)sendDataToDisplayViewController : (Task *)task {
    if(taskDataArray == nil) {
        taskDataArray = [[NSMutableArray alloc] init];
    }
    [taskDataArray addObject : task];
    [self.TableviewContainer reloadData];
}

- (void)sendEditedDataToDisplayViewController : (Task *)task {
    [taskDataArray replaceObjectAtIndex : indexToBeEdited withObject : task];
    [self.TableviewContainer reloadData];
}

- (IBAction)deleteTaskClick : (id)sender {
    UIButton *senderButton = (UIButton*) sender;
    [taskDataArray removeObjectAtIndex : (int)senderButton.tag];
    [self.TableviewContainer reloadData];
}

- (IBAction)editTaskClick : (id)sender {
    UIButton *senderButton = (UIButton*) sender;
    indexToBeEdited = (int)senderButton.tag;
    Task *task =  [taskDataArray objectAtIndex : indexToBeEdited];
    AddViewController *addViewController = [self.storyboard instantiateViewControllerWithIdentifier : addEditController];
    [addViewController editTask : task];
    addViewController.delegate = self;
    [self.navigationController pushViewController : addViewController animated : YES];
}

@end
