//
//  BlockTableViewCell.h
//  SplitDataSource
//
//  Created by Queuey on 16/4/1.
//  Copyright © 2016年 Mr.Q. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlockTableViewCellModel.h"

@interface BlockTableViewCell : UITableViewCell

- (void)configureForCellModel:(BlockTableViewCellModel *)model;

@end
