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
    return CGSizeMake(1, collectionViewSize.height*0.5);
}

- (void)setupUI{
    self.backgroundColor =[UIColor grayColor];
}

- (void)updateWithCellData:(id)aData indexPath:(NSIndexPath *)indexPath{
    
}



@end
