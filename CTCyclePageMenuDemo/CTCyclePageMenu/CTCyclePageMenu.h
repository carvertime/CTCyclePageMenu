//
//  CTCyclePageMenu.h
//  CTCyclePageMenuDemo
//
//  Created by wenjie on 2017/8/4.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTCyclePageMenuProtocol.h"

@interface CTCyclePageMenu : UIView

@property (nonatomic, weak) id<CTCyclePageMenuProtocol> delegate;
@property (nonatomic, copy) void(^handleAction)(CTCyclePageMenu *cyclePageMenu, NSIndexPath *indexPath);
@property (nonatomic, assign, readonly) NSInteger selectedSection;
@property (nonatomic, strong) NSArray *titles;

- (void)registerCellClass:(Class)cellClass;

- (void)registerSlideViewClass:(Class)slideViewClass;

- (void)registerSeparatorViewClass:(Class)separatorViewClass;

- (void)registerDefaultClass;

- (void)selectSection:(NSInteger)section animation:(BOOL)animation;

- (void)reloadData;


@end
