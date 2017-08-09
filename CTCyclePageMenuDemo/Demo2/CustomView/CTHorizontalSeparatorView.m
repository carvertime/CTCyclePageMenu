//
//  CTHorizontalSeparatorView.m
//  CTCyclePageMenuDemo
//
//  Created by wenjie on 2017/8/9.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import "CTHorizontalSeparatorView.h"

@implementation CTHorizontalSeparatorView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor =[UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    }
    return self;
}

+ (CGSize)separatorSizeWithData:(id)aData collectionViewSize:(CGSize)collectionViewSize{
    return CGSizeMake(2, 20);
}

@end
