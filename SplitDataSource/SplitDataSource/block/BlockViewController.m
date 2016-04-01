//
//  BlockViewController.m
//  SplitDataSource
//
//  Created by Queuey on 16/4/1.
//  Copyright © 2016年 Mr.Q. All rights reserved.
//

#import "BlockViewController.h"
#import "BlockDataSource.h"
#import "BlockTableViewCellModel.h"
#import "BlockTableViewCell.h"

static NSString *const kTableViewCellID = @"BlockTableViewCell";

@interface BlockViewController ()
<
UITableViewDelegate
>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) BlockDataSource *dataSource;

@end

@implementation BlockViewController

#pragma mark - life cycle
- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	
	[self.view addSubview:self.tableView];
	
	[self.tableView registerClass:[BlockTableViewCell class]
		   forCellReuseIdentifier:kTableViewCellID];
}

#pragma mark - TableViewDelegate


#pragma mark - private methods

- (NSArray *)arrayWithRandom {
	NSMutableArray *array = [NSMutableArray new];
	for (NSInteger i = 0; i < 10; i ++) {
		NSDictionary *modelDict = @{@"name":[NSString stringWithFormat:@"%ld",i],
									@"headImageName":@"notfound"};
		BlockTableViewCellModel *block = BlockTableViewCellModel.new;
		[block setValuesForKeysWithDictionary:modelDict];
		[array addObject:block];
	}
	return array;
}

#pragma mark - getters and setters
- (UITableView *)tableView {
	if (!_tableView) {
		_tableView = ({
			UITableView *tableView = UITableView.new;
			tableView.frame = self.view.bounds;
			tableView.delegate = self;
			tableView.dataSource = self.dataSource;
			tableView;
		});
	}
	return _tableView;
}

- (BlockDataSource *)dataSource {
	if (!_dataSource) {
		TableViewCellConfigureBlock configureBlock;
		configureBlock = ^(BlockTableViewCell *cell, BlockTableViewCellModel *model) {
			[cell configureForCellModel:model];
		};
		_dataSource = [[BlockDataSource alloc] initWithItems:[self arrayWithRandom]
											  cellIdentifier:kTableViewCellID
										  configureCellBlock:configureBlock];
	}
	return _dataSource;
}

@end
