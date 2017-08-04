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
@property (nonatomic, assign) CGFloat currentOriginX;

@end

@implementation CTCyclePageFlowLayout

- (void)prepareLayout{
    
    [super prepareLayout];
    
    CTCyclePageMenu <UICollectionViewDelegateFlowLayout>*delegate = (id)self.collectionView.delegate;
    
    self.cellLayoutInfos = [NSMutableDictionary dictionary];
    self.footerLayoutInfos = [NSMutableDictionary dictionary];

    CGFloat totalWidth = 0.f;
    NSInteger sectionNum = [self.collectionView numberOfSections];
    
    CGSize footerSize = [delegate collectionView:self.collectionView layout:self referenceSizeForFooterInSection:0];
    if (sectionNum == 1) {
        footerSize = CGSizeZero;
    }
    
    for (NSInteger i = 0; i < sectionNum; i++) {
        CGSize size = [delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:i]];
        totalWidth += size.width + footerSize.width;
    }
    
    self.currentOriginX = 0.f;
    CGFloat collectionViewWidth = self.collectionView.frame.size.width;
    CGFloat cellWidth = (collectionViewWidth - (footerSize.width* (sectionNum - 1))) / sectionNum;
        
    for (NSInteger i = 0; i < sectionNum; i++) {
        UICollectionViewLayoutAttributes *cellAttribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:0 inSection:i]];
        CGSize cellSize = [delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:i]];
        if (totalWidth > collectionViewWidth) {
            cellWidth = cellSize.width;
        }
        cellAttribute.frame = CGRectMake(self.currentOriginX, cellAttribute.frame.origin.y, cellWidth, cellSize.height);
        
        UICollectionViewLayoutAttributes *footerAttribute = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter withIndexPath:[NSIndexPath indexPathForItem:0 inSection:i]];
        
        footerAttribute.frame = CGRectMake(CGRectGetMaxX(cellAttribute.frame), (self.collectionView.frame.size.height - footerSize.height) * 0.5, footerSize.width, footerSize.height);
        
        [self.cellLayoutInfos setObject:cellAttribute forKey:[NSIndexPath indexPathForItem:0 inSection:i]];
        
        if (i == sectionNum - 1) {
            self.currentOriginX += cellAttribute.frame.size.width;
        } else {
            self.currentOriginX += cellAttribute.frame.size.width + footerAttribute.frame.size.width;
            [self.footerLayoutInfos setObject:footerAttribute forKey:[NSIndexPath indexPathForItem:0 inSection:i]];
        }
    }

}

- (CGSize)collectionViewContentSize{
    if (self.currentOriginX != 0) {
         return CGSizeMake(self.currentOriginX, self.collectionView.frame.size.height);
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
