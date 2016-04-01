//
//  YBTableViewCellModel.m
//  SplitDataSource
//
//  Created by Queuey on 16/4/1.
//  Copyright © 2016年 Mr.Q. All rights reserved.
//

#import "YBTableViewCellModel.h"

@implementation YBTableViewCellModel

/**
 *	数据的加工在Model中进行
 */
- (instancetype)initWithDictionary:(NSDictionary *)dict {
	if (self = [super init]) {
		_name = [NSString stringWithFormat:@"第 %@ 行",dict[@"name"]];
		_headImageName = dict[@"headImageName"];
	}
	return self;
}




@end
