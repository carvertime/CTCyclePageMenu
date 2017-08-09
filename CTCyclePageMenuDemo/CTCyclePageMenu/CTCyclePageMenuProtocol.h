//
//  CTCyclePageMenuProtocol.h
//  CTCyclePageMenuDemo
//
//  Created by wenjie on 2017/8/4.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CTCyclePageMenu;

@protocol CTCyclePageMenuProtocol <NSObject>

@optional

/** 菜单模块点击的回调方法 */
- (void)cyclePageMenu:(CTCyclePageMenu *)cyclePageMenu didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@protocol CTCyclePageCellProtocol <NSObject>

@optional

/** 更新模块视图 */
- (void)updateCellWithData:(id)aData indexPath:(NSIndexPath *)indexPath;

/** 选中模块时更新模块视图的方法 */
- (void)didSelectCellWithData:(id)aData indexPath:(NSIndexPath *)indexPath;

@required

/** 返回模块尺寸 */
+ (CGSize)cellSizeWithData:(id)aData collectionViewSize:(CGSize)collectionViewSize indexPath:(NSIndexPath *)indexPath;

@end

@protocol CTCyclePageSeparatorProtocol <NSObject>

@optional

/** 返回分割条尺寸 */
+ (CGSize)separatorSizeWithData:(id)aData collectionViewSize:(CGSize)collectionViewSize;

/** 更新分割条视图 */
- (void)updateSeparatorWithData:(id)aData indexPath:(NSIndexPath *)indexPath;

@end

@protocol CTCyclePageSlideViewProtocol <NSObject>

@optional

/** 返回滑块尺寸 */
- (CGSize)slideSizeWithData:(id)aData collectionViewSize:(CGSize)collectionViewSize indexPath:(NSIndexPath *)indexPath;

@end
