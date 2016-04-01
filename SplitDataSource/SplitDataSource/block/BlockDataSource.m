//
//  BlockDataSource.m
//  SplitDataSource
//
//  Created by Queuey on 16/4/1.
//  Copyright © 2016年 Mr.Q. All rights reserved.
//

#import "BlockDataSource.h"

@interface BlockDataSource ()

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) TableViewCellConfigureBlock configureBlock;

@end

@implementation BlockDataSource

- (instancetype)init {
	return nil;
}

- (instancetype)initWithItems:(NSArray *)items cellIdentifier:(NSString *)cellIdentifier configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock {
	if (self = [super init]) {
		self.items = items;
		self.cellIdentifier = cellIdentifier.copy;
		self.configureBlock = [configureCellBlock copy];
	}
	return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
	return self.items[indexPath.row];
}

#pragma mark - tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
	id item = [self itemAtIndexPath:indexPath];
	self.configureBlock(cell,item);
	
	return cell;
}

@end
