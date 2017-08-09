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
- (void)cyclePageMenu:(CTCyclePageMenu *)cyclePageMenu didSelectItemAtIndexPath:(NSIndexPath *)indexPath;


@end

@protocol CTCyclePageCellProtocol <NSObject>

@optional
- (void)updateWithCellData:(id)aData indexPath:(NSIndexPath *)indexPath;
- (void)didSelectCellData:(id)aData indexPath:(NSIndexPath *)indexPath;
- (CGFloat)cellWidthWithCellData:(id)aData indexPath:(NSIndexPath *)indexPath;
+ (CGSize)sizeForDataSource:(NSArray *)dataSource collectionViewSize:(CGSize)collectionViewSize spaces:(CGFloat)spaces indexPath:(NSIndexPath *)indexPath;
+ (CGSize)separatorWidthWithCellData:(id)aData collectionViewSize:(CGSize)collectionViewSize;

@end

@protocol CTCyclePageSlideViewProtocol <NSObject>

@optional
- (CGFloat)cyclePageSlideViewHeight;
- (CGFloat)cyclePageSlideViewWidth;

@end
