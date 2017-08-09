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

/** 菜单的代理处理模块点击事件 */
@property (nonatomic, weak) id<CTCyclePageMenuProtocol> delegate;

/** 菜单点击事件回调 */
@property (nonatomic, copy) void(^handleAction)(CTCyclePageMenu *cyclePageMenu, NSIndexPath *indexPath);

/** 选中的模块 */
@property (nonatomic, assign) NSInteger selectedSection;

/** 菜单标题数组 */
@property (nonatomic, strong) NSArray *titles;

/** 菜单滚动方向 */
@property (nonatomic, assign) UICollectionViewScrollDirection scrollDirection;

/** 如果模块总长度小于菜单长度是否自动补齐 */
@property (nonatomic, assign) BOOL automaticallyAdjustsMenu;

/** 是否显示水平滚动条 */
@property (nonatomic, assign) BOOL showsHorizontalScrollIndicator;

/** 是否显示垂直滚动条 */
@property (nonatomic, assign) BOOL showsVerticalScrollIndicator;

/** 滚动条样式 */
@property (nonatomic, assign) UIScrollViewIndicatorStyle indicatorStyle;

/** 注册模块视图(类型是UICollectionViewCell的子类) */
- (void)registerCellClass:(Class)cellClass;

/** 注册滑块视图(类型是UIView的子类) */
- (void)registerSlideViewClass:(Class)slideViewClass;

/** 注册分割线(类型是UICollectionReusableView的子类) */
- (void)registerSeparatorViewClass:(Class)separatorViewClass;

/** 主动选中模块 */
- (void)selectSection:(NSInteger)section animation:(BOOL)animation;

/** 主动刷新数据 */
- (void)reloadData;


@end
