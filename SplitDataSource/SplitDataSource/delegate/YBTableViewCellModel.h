//
//  YBTableViewCellModel.h
//  SplitDataSource
//
//  Created by Queuey on 16/4/1.
//  Copyright © 2016年 Mr.Q. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YBTableViewCellModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *headImageName;


- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
