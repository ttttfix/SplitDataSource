//
//  TableViewDataSource.h
//  SplitDataSource
//
//  Created by Queuey on 16/4/1.
//  Copyright © 2016年 Mr.Q. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol UITableViewLifeDelegate <NSObject>

- (void)tableViewWillStartLoadData;

- (void)tableViewDidSuccessLoadData;

- (void)tableViewDidFailedLoadData;


@end


@interface TableViewDataSource : NSObject
<
UITableViewDataSource
>

@property (nonatomic, weak) id<UITableViewLifeDelegate> delegate;

- (BOOL)loadData;

- (BOOL)loadNextPage;

@end
