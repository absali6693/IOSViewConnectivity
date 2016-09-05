//
//  ViewController.m
//  Task Manager 0
//
//  Created by GrepRuby1 on 31/08/16.
//  Copyright © 2016 GrepRuby. All rights reserved.
//

#import "DisplayViewController.h"
#import "TableCell.h"
#import "AddViewController.h"
#import "SignInViewController.h"

@interface DisplayViewController () <UITableViewDataSource,UITableViewDelegate> {
    NSMutableArray *taskDataArray;
    int indexToBeEdited;
    User *userData;
}

@property (weak, nonatomic) IBOutlet UITableView *tableviewContainer;

@end

@implementation DisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableviewContainer.estimatedRowHeight = 111.0;
    self.tableviewContainer.rowHeight = UITableViewAutomaticDimension;
    [self.navigationItem setHidesBackButton:YES animated:YES];
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
    TableCell *cell = (TableCell *)[tableView dequeueReusableCellWithIdentifier : cellPrototype];
    if(cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed : cellPrototype owner : self options : nil];
        cell = [nib objectAtIndex : 0];
    }
    int row = (int)[indexPath row];
    Task *task = [taskDataArray objectAtIndex : row];
    [cell addDataToTableCellWithTask:task index : (int)indexPath.row deleteToMethod : @selector(deleteTaskClick :) editToMethod : @selector(editTaskClick :) uiViewController : self];
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

- (void)setUserData : (User *)user {
    userData = user;
    taskDataArray = [NSMutableArray arrayWithArray:[user getTasks]];
}

- (void)sendDataToDisplayViewController : (Task *)task {
    if(taskDataArray == nil) {
        taskDataArray = [[NSMutableArray alloc] init];
    }
    [taskDataArray addObject : task];
    if([userData getTasks] == nil)
    {
        [userData initTasks];
    }
    [userData addTask : task];
    [self.tableviewContainer reloadData];
}

- (void)sendEditedDataToDisplayViewController : (Task *)task {
    [taskDataArray replaceObjectAtIndex : indexToBeEdited withObject : task];
    [userData editTask:task atPosition:indexToBeEdited];
    [self.tableviewContainer reloadData];
}

- (IBAction)deleteTaskClick : (id)sender {
    UIButton *senderButton = (UIButton*) sender;
    [taskDataArray removeObjectAtIndex : (int)senderButton.tag];
    [self.tableviewContainer reloadData];
}

- (IBAction)addTaskClick : (id)sender {
    AddViewController *addViewController = [self.storyboard instantiateViewControllerWithIdentifier : addEditController];
    addViewController.delegate = self;
    addViewController.title = @"Add Task";
    [self.navigationController pushViewController : addViewController animated : YES];
}

- (IBAction)signOutClicked:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (IBAction)editTaskClick : (id)sender {
    UIButton *senderButton = (UIButton*) sender;
    indexToBeEdited = (int)senderButton.tag;
    Task *task =  [taskDataArray objectAtIndex : indexToBeEdited];
    AddViewController *editViewController = [self.storyboard instantiateViewControllerWithIdentifier : addEditController];
    [editViewController editTask : task];
    
    editViewController.title = @"Edit Task";
    editViewController.delegate = self;
    [self.navigationController pushViewController : editViewController animated : YES];
}

@end
