//
//  CTVerticalSlideView.m
//  CTCyclePageMenuDemo
//
//  Created by wenjie on 2017/8/9.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import "CTVerticalSlideView.h"

@implementation CTVerticalSlideView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:252/255.0 green:87/255.0 blue:93/255.0 alpha:1];
    }
    return self;
}

- (CGSize)slideSizeWithData:(id)aData collectionViewSize:(CGSize)collectionViewSize indexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(2, 80);
}

@end
