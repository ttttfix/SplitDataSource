//
//  YBTableViewCell.m
//  SplitDataSource
//
//  Created by Queuey on 16/4/1.
//  Copyright © 2016年 Mr.Q. All rights reserved.
//

#import "YBTableViewCell.h"

@interface YBTableViewCell ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *headImageView;

@end

@implementation YBTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
		[self addSubview: self.nameLabel];
		[self addSubview:self.headImageView];
		[self setupLayoutSubViews];
	}
	return self;
}


- (void)setupLayoutSubViews {
	self.headImageView.frame = CGRectMake(CGRectGetWidth(self.bounds) / 2, 0, CGRectGetWidth(self.bounds) / 2, CGRectGetHeight(self.bounds));
	self.nameLabel.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds) / 2, CGRectGetHeight(self.bounds));
}

#pragma mark - seter && geter
- (void)setModel:(YBTableViewCellModel *)model {
	if (_model) {
		_model = nil;
	}
	_model = model;
	self.nameLabel.text = _model.name;
	self.headImageView.image = [UIImage imageNamed:_model.headImageName];
}

- (UILabel *)nameLabel {
	if (!_nameLabel) {
		_nameLabel = ({
			UILabel *label = [UILabel new];
			label.textColor = [UIColor redColor];
			label.textAlignment = NSTextAlignmentCenter;
			
			label;
		});
	}
	return _nameLabel;
}

- (UIImageView *)headImageView {
	if (!_headImageView) {
		_headImageView = ({
			UIImageView *view = [UIImageView new];
			view;
		});
	}
	return _headImageView;
}

@end
