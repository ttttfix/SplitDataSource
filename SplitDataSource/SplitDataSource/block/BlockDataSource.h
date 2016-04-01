//
//  BlockDataSource.h
//  SplitDataSource
//
//  Created by Queuey on 16/4/1.
//  Copyright © 2016年 Mr.Q. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^TableViewCellConfigureBlock)(id cell, id item);

@interface BlockDataSource : NSObject
<
UITableViewDataSource
>

- (instancetype)initWithItems:(NSArray *)items
			   cellIdentifier:(NSString *) cellIdentifier
		   configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
