//
//  TableCell.h
//  Task Manager 0
//
//  Created by GrepRuby1 on 01/09/16.
//  Copyright © 2016 GrepRuby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableCellPrototype : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *taskLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionForTaskLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeRequiredLabel;
@property (weak, nonatomic) IBOutlet UIButton *deleteTheTaskButton;
@property (weak, nonatomic) IBOutlet UIButton *editTheTaskButton;

@end
