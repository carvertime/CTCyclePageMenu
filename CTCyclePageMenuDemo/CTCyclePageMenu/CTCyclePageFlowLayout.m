//
//  CTCyclePageFlowLayout.m
//  CTCyclePageMenuDemo
//
//  Created by wenjie on 2017/8/8.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import "CTCyclePageFlowLayout.h"
#import "CTCyclePageMenuProtocol.h"
#import "CTCyclePageMenu.h"

@interface CTCyclePageFlowLayout ()

@property (nonatomic, strong) NSMutableDictionary *cellLayoutInfos;
@property (nonatomic, strong) NSMutableDictionary *footerLayoutInfos;
@property (nonatomic, assign) CGFloat currentLength;

@end

@implementation CTCyclePageFlowLayout

- (void)prepareLayout{
    
    [super prepareLayout];
    
    self.cellLayoutInfos = [NSMutableDictionary dictionary];
    self.footerLayoutInfos = [NSMutableDictionary dictionary];
    
    if (self.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
        [self prepareLayoutHorizontal];
    } else {
        [self prepareLayoutVertical];
    }
    
}

- (void)prepareLayoutVertical{
    
    CTCyclePageMenu <UICollectionViewDelegateFlowLayout>*delegate = (id)self.collectionView.delegate;
    
    CGFloat totalHeigth = 0;
    NSInteger sectionNum = [self.collectionView numberOfSections];
    
    CGSize footerSize = [delegate collectionView:self.collectionView layout:self referenceSizeForFooterInSection:0];
    if (sectionNum == 1) {
        footerSize = CGSizeZero;
    }
    
    for (NSInteger i = 0; i < sectionNum; i++) {
        CGSize size = [delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:i]];
        if (i == sectionNum - 1) {
            totalHeigth += size.height;
        } else {
            totalHeigth += size.height + footerSize.height;
        }
    }
    
    self.currentLength = 0;
    CGFloat collectionViewHeight = self.collectionView.frame.size.height;
    CGFloat collectionViewWidth = self.collectionView.frame.size.width;
    CGFloat cellHeight = (collectionViewHeight - (footerSize.height* (sectionNum - 1))) / sectionNum;
    
    for (NSInteger i = 0; i < sectionNum; i++) {
        UICollectionViewLayoutAttributes *cellAttribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:0 inSection:i]];
        CGSize cellSize = [delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:i]];
        if (totalHeigth > collectionViewHeight || !delegate.automaticallyAdjustsMenu) {
            cellHeight = cellSize.height;
        }
        cellAttribute.frame = CGRectMake((collectionViewWidth - cellSize.width) * 0.5, self.currentLength, cellSize.width, cellHeight);
        
        UICollectionViewLayoutAttributes *footerAttribute = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter withIndexPath:[NSIndexPath indexPathForItem:0 inSection:i]];
        
        footerAttribute.frame = CGRectMake((self.collectionView.frame.size.width - footerSize.width) * 0.5, CGRectGetMaxY(cellAttribute.frame), footerSize.width, footerSize.height);
        
        [self.cellLayoutInfos setObject:cellAttribute forKey:[NSIndexPath indexPathForItem:0 inSection:i]];
        
        if (i == sectionNum - 1) {
            self.currentLength += cellAttribute.frame.size.height;
        } else {
            self.currentLength += cellAttribute.frame.size.height + footerAttribute.frame.size.height;
            [self.footerLayoutInfos setObject:footerAttribute forKey:[NSIndexPath indexPathForItem:0 inSection:i]];
        }
    }

}

- (void)prepareLayoutHorizontal{
    
    CTCyclePageMenu <UICollectionViewDelegateFlowLayout>*delegate = (id)self.collectionView.delegate;
    
    CGFloat totalWidth = 0;
    NSInteger sectionNum = [self.collectionView numberOfSections];
    
    CGSize footerSize = [delegate collectionView:self.collectionView layout:self referenceSizeForFooterInSection:0];
    if (sectionNum == 1) {
        footerSize = CGSizeZero;
    }
    
    for (NSInteger i = 0; i < sectionNum; i++) {
        CGSize size = [delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:i]];
        if (i == sectionNum - 1) {
            totalWidth += size.width;
        } else {
            totalWidth += size.width + footerSize.width;
        }
    }
    
    self.currentLength = 0;
    CGFloat collectionViewHeight = self.collectionView.frame.size.height;
    CGFloat collectionViewWidth = self.collectionView.frame.size.width;
    CGFloat cellWidth = (collectionViewWidth - (footerSize.width* (sectionNum - 1))) / sectionNum;
    
    for (NSInteger i = 0; i < sectionNum; i++) {
        UICollectionViewLayoutAttributes *cellAttribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:0 inSection:i]];
        CGSize cellSize = [delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:i]];
        if (totalWidth > collectionViewWidth || !delegate.automaticallyAdjustsMenu) {
            cellWidth = cellSize.width;
        }
        cellAttribute.frame = CGRectMake(self.currentLength, (collectionViewHeight - cellSize.height) * 0.5, cellWidth, cellSize.height);
        
        UICollectionViewLayoutAttributes *footerAttribute = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter withIndexPath:[NSIndexPath indexPathForItem:0 inSection:i]];
        
        footerAttribute.frame = CGRectMake(CGRectGetMaxX(cellAttribute.frame), (self.collectionView.frame.size.height - footerSize.height) * 0.5, footerSize.width, footerSize.height);
        
        [self.cellLayoutInfos setObject:cellAttribute forKey:[NSIndexPath indexPathForItem:0 inSection:i]];
        
        if (i == sectionNum - 1) {
            self.currentLength += cellAttribute.frame.size.width;
        } else {
            self.currentLength += cellAttribute.frame.size.width + footerAttribute.frame.size.width;
            [self.footerLayoutInfos setObject:footerAttribute forKey:[NSIndexPath indexPathForItem:0 inSection:i]];
        }
    }

}


- (CGSize)collectionViewContentSize{
    if (self.currentLength != 0) {
        if (self.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
            return CGSizeMake(self.currentLength, self.collectionView.frame.size.height);
        } else {
            return CGSizeMake(self.collectionView.frame.size.width, self.currentLength);
        }
    } else {
        return [super collectionViewContentSize];
    }
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSMutableArray *allAttributes = [NSMutableArray array];
    
    for (NSIndexPath *cellIndexPath in [self.cellLayoutInfos allKeys]) {
        UICollectionViewLayoutAttributes *attribute = self.cellLayoutInfos[cellIndexPath];
        if (CGRectIntersectsRect(rect, attribute.frame)) {
            [allAttributes addObject:attribute];
        }
    }
    
    for (NSIndexPath *footerIndexPath in [self.footerLayoutInfos allKeys]) {
        UICollectionViewLayoutAttributes *attribute = self.footerLayoutInfos[footerIndexPath];
        if (CGRectIntersectsRect(rect, attribute.frame)) {
            [allAttributes addObject:attribute];
        }
    }
    
    return allAttributes;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}




@end
