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
- (void)updateCellWithData:(id)aData indexPath:(NSIndexPath *)indexPath;
- (void)didSelectCellWithData:(id)aData indexPath:(NSIndexPath *)indexPath;
- (CGFloat)cellWidthWithData:(id)aData indexPath:(NSIndexPath *)indexPath;


@required
+ (CGSize)cellSizeWithData:(id)aData collectionViewSize:(CGSize)collectionViewSize indexPath:(NSIndexPath *)indexPath;

@end

@protocol CTCyclePageSeparatorProtocol <NSObject>

@optional
+ (CGSize)separatorSizeWithData:(id)aData collectionViewSize:(CGSize)collectionViewSize;
- (void)updateSeparatorWithData:(id)aData indexPath:(NSIndexPath *)indexPath;

@end

@protocol CTCyclePageSlideViewProtocol <NSObject>

@optional

- (CGSize)slideSizeWithData:(id)aData collectionViewSize:(CGSize)collectionViewSize indexPath:(NSIndexPath *)indexPath;

@end
