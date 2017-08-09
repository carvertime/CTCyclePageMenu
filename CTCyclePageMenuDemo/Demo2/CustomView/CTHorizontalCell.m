//
//  CTHorizontalCell.m
//  CTCyclePageMenuDemo
//
//  Created by wenjie on 2017/8/9.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import "CTHorizontalCell.h"

@interface CTHorizontalCell ()

@property (nonatomic, strong) UILabel *titleLb;

@end

@implementation CTHorizontalCell

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
    return CGSizeMake(100, 40);
}

- (void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    if (selected) {
        self.titleLb.textColor = [UIColor colorWithRed:252/255.0 green:87/255.0 blue:93/255.0 alpha:1];
    } else {
        self.titleLb.textColor = [UIColor grayColor];
    }
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
