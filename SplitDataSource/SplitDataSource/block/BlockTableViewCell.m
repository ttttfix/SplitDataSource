//
//  BlockTableViewCell.m
//  SplitDataSource
//
//  Created by Queuey on 16/4/1.
//  Copyright © 2016年 Mr.Q. All rights reserved.
//

#import "BlockTableViewCell.h"

@implementation BlockTableViewCell

- (void)configureForCellModel:(BlockTableViewCellModel *)model {
	self.textLabel.text = model.name;
	
}

@end
