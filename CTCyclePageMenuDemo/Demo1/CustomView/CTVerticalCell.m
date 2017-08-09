//
//  CTVerticalCell.m
//  CTCyclePageMenuDemo
//
//  Created by wenjie on 2017/8/9.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import "CTVerticalCell.h"

@interface CTVerticalCell ()

@property (nonatomic, strong) UILabel *titleLb;

@end

@implementation CTVerticalCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.titleLb];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.titleLb.frame = self.bounds;
}

+ (CGSize)cellSizeWithData:(id)aData collectionViewSize:(CGSize)collectionViewSize indexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(44, 100);
}

- (void)updateCellWithData:(id)aData indexPath:(NSIndexPath *)indexPath{
    self.titleLb.text = aData;
}

- (UILabel *)titleLb{
    if (_titleLb == nil) {
        _titleLb = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLb.font = [UIFont systemFontOfSize:14];
        _titleLb.textAlignment = NSTextAlignmentCenter;
        _titleLb.textColor = [UIColor grayColor];
    }
    return _titleLb;
}

@end
