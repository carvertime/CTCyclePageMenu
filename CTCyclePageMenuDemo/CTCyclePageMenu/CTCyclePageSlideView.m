//
//  CTCyclePageSlideView.m
//  CTCyclePageMenuDemo
//
//  Created by wenjie on 2017/8/4.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import "CTCyclePageSlideView.h"

@implementation CTCyclePageSlideView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:252/255.0 green:87/255.0 blue:93/255.0 alpha:1];
    }
    return self;
}

- (CGFloat)cyclePageSlideViewHeight{
    return 2;
}

@end
