//
//  TableCell.m
//  Task Manager 0
//
//  Created by GrepRuby1 on 01/09/16.
//  Copyright © 2016 GrepRuby. All rights reserved.
//

#import "TableCell.h"

@implementation TableCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected : (BOOL)selected animated : (BOOL)animated {
    [super setSelected : selected animated : animated];
    // Configure the view for the selected state
}

- (void) addDataToTableCellWithTask : (Task *)task index : (int)index deleteToMethod : (SEL) deleteTaskClick editToMethod : (SEL) editTaskClick uiViewController : (UIViewController *) uiViewController{
    self.taskLabel.text = task.task;
    self.descriptionForTaskLabel.text = task.descriptionOfTask;
    self.timeRequiredLabel.text = task.timeOfTask;
    self.deleteTheTaskButton.tag = index;
    self.editTheTaskButton.tag = index;
    [self.deleteTheTaskButton addTarget : uiViewController action : deleteTaskClick forControlEvents : UIControlEventTouchUpInside];
    [self.editTheTaskButton addTarget : uiViewController action : editTaskClick forControlEvents :UIControlEventTouchUpInside];
    
}

@end
