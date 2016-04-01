//
//  ViewController.m
//  SplitDataSource
//
//  Created by Queuey on 16/4/1.
//  Copyright © 2016年 Mr.Q. All rights reserved.
//

#import "ViewController.h"
#import "TableViewDataSource.h"

@interface ViewController ()
<
UITableViewDelegate,
UITableViewLifeDelegate
>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) TableViewDataSource *dataSource;
@property (nonatomic, strong) UIActivityIndicatorView *activity;

@end


@implementation ViewController

#pragma mark - life cycle

- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	
	[self.view addSubview:self.tableView];
	[self.view addSubview:self.activity];
	[self.dataSource loadData];
}

#pragma mark - delegate
- (void)tableViewWillStartLoadData {
	[self.activity startAnimating];
}

- (void)tableViewDidSuccessLoadData {
	[self.tableView reloadData];
	[self.activity stopAnimating];
}

- (void)tableViewDidFailedLoadData {
	
}


#pragma mark - event response



#pragma mark - private methods



#pragma mark - getters and setters

- (UITableView *)tableView {
	if (!_tableView) {
		_tableView = ({
			UITableView *tableView = UITableView.new;
			tableView.frame = self.view.bounds;
			tableView.delegate = self;
			tableView.dataSource = self.dataSource;
			tableView.tableFooterView = UIView.new;
			tableView;
		});
	}
	return _tableView;
}

- (TableViewDataSource *)dataSource {
	if (!_dataSource) {
		_dataSource = TableViewDataSource.new;
		_dataSource.delegate = self;
	}
	return _dataSource;
}


- (UIActivityIndicatorView *)activity {
	if (!_activity) {
		_activity = ({
			UIActivityIndicatorView *view;
			view = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
			[view setHidesWhenStopped:YES];
			view.center = self.view.center;
			view.color = [UIColor redColor];
			view;
		});
	}
	return _activity;
}


@end
