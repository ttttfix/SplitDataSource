//
//  TableViewDataSource.m
//  SplitDataSource
//
//  Created by Queuey on 16/4/1.
//  Copyright © 2016年 Mr.Q. All rights reserved.
//

#import "TableViewDataSource.h"
#import "YBTableViewCell.h"
#import "YBTableViewCellModel.h"

static NSString * const kTableViewCellID = @"YBTableViewCell";

@interface TableViewDataSource ()

@property (nonatomic, strong) NSMutableArray *cells;

@end

@implementation TableViewDataSource


#pragma mark - TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.cells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	YBTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewCellID];
	if (!cell) {
		cell = [[YBTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kTableViewCellID];
	}
	cell.model = self.cells[indexPath.row];
	
	return cell;
}

#pragma mark - Private Method
- (BOOL)loadData {
	[self.delegate tableViewWillStartLoadData];
	//网络请求放这里
	//[self.cells removeAllObjects];
	
	//[self addCellData];
	[self performSelector:@selector(addCellData) withObject:nil afterDelay:1];
	
	return YES;
}

- (BOOL)loadNextPage {
	//网络请求放这里
	//[self addCellData];
	return YES;
}

- (void)addCellData {
	for (NSInteger i = 0; i < 10; i ++) {
		NSDictionary *modelDict = @{@"name":[NSString stringWithFormat:@"%ld",i],
									@"headImageName":@"notfound"};
		YBTableViewCellModel *model = [[YBTableViewCellModel alloc] initWithDictionary:modelDict];
		[self.cells addObject:model];
	}
	[self.delegate tableViewDidSuccessLoadData];
}

#pragma mark - set && get
- (NSMutableArray *)cells {
	if (!_cells) {
		_cells = [[NSMutableArray alloc] init];;
	}
	return _cells;
}


@end
