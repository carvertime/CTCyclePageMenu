//
//  CTCyclePageSeparatorView.m
//  CTCyclePageMenuDemo
//
//  Created by wenjie on 2017/8/7.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import "CTCyclePageSeparatorView.h"

@implementation CTCyclePageSeparatorView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

+ (CGSize)separatorWidthWithCellData:(id)aData collectionViewSize:(CGSize)collectionViewSize{
    return CGSizeMake(1, 20);
}

- (void)setupUI{
    self.backgroundColor =[UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
}

- (void)updateWithCellData:(id)aData indexPath:(NSIndexPath *)indexPath{
    
}



@end
