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

+ (CGSize)cellSizeWithData:(id)aData collectionViewSize:(CGSize)collectionViewSize indexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100, 40);
}

- (void)updateCellWithData:(id)aData indexPath:(NSIndexPath *)indexPath{
    self.titleLb.text = aData;
}

- (UILabel *)titleLb{
    if (_titleLb == nil) {
        _titleLb = [[UILabel alloc] initWithFrame:CGRectZero];
    }
    return _titleLb;
}

@end
