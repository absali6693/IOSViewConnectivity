//
//  ViewController.m
//  Task Manager 0
//
//  Created by GrepRuby1 on 31/08/16.
//  Copyright © 2016 GrepRuby. All rights reserved.
//

#import "DisplayViewController.h"
#import "TableCellPrototype.h"

@interface DisplayViewController () <UITableViewDataSource,UITabBarDelegate>
{
    NSString *taskToBePerformed;
    NSString *descriptionForTask;
    NSString *timeRequired;
    NSMutableArray *taskData;
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return taskData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableCellPrototype *cell = (TableCellPrototype *)[tableView dequeueReusableCellWithIdentifier:@"TableCellPrototype"];
    if(cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableCellPrototype" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    int row = (int)[indexPath row];
    Task *task = [taskData objectAtIndex:row];
    cell.task.text = task.task;//[NSString stringWithFormat:@"Table %ld",(long)indexPath.row];
    cell.descriptionForTask.text = task.descriptionOfTask;
    cell.timeRequired.text = task.timeOfTask;

    return cell;
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:addSegue]){
        AddViewController *addViewController = segue.destinationViewController;
        addViewController.delegate = self;
        
    }
}

- (void)sendDataToDisplayViewController:(Task *)task{
    NSLog(@"Delegate");
     Task *data = task;
    taskToBePerformed = data.task;
    descriptionForTask = data.descriptionOfTask;
    timeRequired = data.timeOfTask;
    if(taskData == nil){
        taskData = [[NSMutableArray alloc] init];
    }
    [taskData addObject:task];
    [self.TableviewContainer reloadData];
}

@end
