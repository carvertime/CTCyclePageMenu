//
//  CTVerticalSeparatorView.m
//  CTCyclePageMenuDemo
//
//  Created by wenjie on 2017/8/9.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import "CTVerticalSeparatorView.h"

@implementation CTVerticalSeparatorView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor =[UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    }
    return self;
}

+ (CGSize)separatorSizeWithData:(id)aData collectionViewSize:(CGSize)collectionViewSize{
    return CGSizeMake(20, 2);
}


@end
