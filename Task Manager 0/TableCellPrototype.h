//
//  TableCell.h
//  Task Manager 0
//
//  Created by GrepRuby1 on 01/09/16.
//  Copyright © 2016 GrepRuby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableCellPrototype : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *task;
@property (strong, nonatomic) IBOutlet UILabel *descriptionForTask;
@property (strong, nonatomic) IBOutlet UILabel *timeRequired;
@property (weak, nonatomic) IBOutlet UIButton *deleteTheTaskButton;
@property (weak, nonatomic) IBOutlet UIButton *editTheTask;

@end
