//
//  CTCyclePageMenu.m
//  CTCyclePageMenuDemo
//
//  Created by wenjie on 2017/8/4.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import "CTCyclePageMenu.h"
#import "CTCyclePageSlideView.h"
#import "CTCyclePageCell.h"
#import "CTCyclePageSeparatorView.h"
#import "CTCyclePageFlowLayout.h"

@interface CTCyclePageMenu ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) CTCyclePageFlowLayout *flowLayout;
@property (nonatomic, strong) UIView <CTCyclePageSlideViewProtocol>*cyclePageSlideView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, assign) NSInteger lastSelectedSection;
@property (nonatomic, assign, readwrite) NSInteger selectedSection;

@property (nonatomic, strong) NSString *cellIdentifier;
@property (nonatomic, strong) NSString *separatorIdentifier;

@end

@implementation CTCyclePageMenu


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.collectionView];
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGFloat slideViewHeight = 0.f;
    if ([self.cyclePageSlideView respondsToSelector:@selector(cyclePageSlideViewHeight)]) {
        slideViewHeight = [self.cyclePageSlideView cyclePageSlideViewHeight];
    }
    self.collectionView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - slideViewHeight);
    
    UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:self.selectedSection]];
    self.cyclePageSlideView.frame = CGRectMake(cell.frame.origin.x-self.collectionView.contentOffset.x, self.frame.size.height - slideViewHeight, cell.frame.size.width, slideViewHeight);
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    Class cellClass = NSClassFromString(self.cellIdentifier);
    if ([cellClass respondsToSelector:@selector(sizeForDataSource:collectionViewSize:spaces:indexPath:)]) {
        Class separatorClass = NSClassFromString(self.separatorIdentifier);
        CGFloat spaces = 0.f;
        if ([separatorClass respondsToSelector:@selector(separatorWidthWithCellData:collectionViewSize:)]) {
            spaces = [separatorClass separatorWidthWithCellData:self.dataSource collectionViewSize:self.collectionView.frame.size].width * (self.dataSource.count - 1);
        }
        if ([cellClass respondsToSelector:@selector(sizeForDataSource:collectionViewSize:spaces:indexPath:)]) {
            return [cellClass sizeForDataSource:self.dataSource collectionViewSize:collectionView.frame.size spaces:spaces indexPath:indexPath];
        } else {
            return CGSizeZero;
        }
    } else {
        return CGSizeZero;
    }
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    if (newSuperview) {
        [self reloadData];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionNone];
            [self p_collectionView:self.collectionView didSelectItemAtIndexpath:[NSIndexPath indexPathForItem:0 inSection:0] animation:NO];
        });
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    Class class = NSClassFromString(self.separatorIdentifier);
    if ([class respondsToSelector:@selector(separatorWidthWithCellData:collectionViewSize:)]) {
        return [class separatorWidthWithCellData:self.dataSource collectionViewSize:self.collectionView.frame.size];
    } else {
        return CGSizeZero;
    }
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.dataSource.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.dataSource[section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell <CTCyclePageCellProtocol>*cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.cellIdentifier forIndexPath:indexPath];
    if ([cell respondsToSelector:@selector(updateWithCellData:indexPath:)]) {
        [cell updateWithCellData:self.dataSource[indexPath.section][indexPath.row] indexPath:indexPath];
    }
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView <CTCyclePageCellProtocol>*separatorView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:self.separatorIdentifier forIndexPath:indexPath];
    if ([separatorView respondsToSelector:@selector(updateWithCellData:indexPath:)]) {
        [separatorView updateWithCellData:self.dataSource[indexPath.row] indexPath:indexPath];
    }
    return separatorView;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self p_collectionView:collectionView didSelectItemAtIndexpath:indexPath animation:YES];
}

- (void)p_collectionView:(UICollectionView *)collectionView didSelectItemAtIndexpath:(NSIndexPath *)indexPath animation:(BOOL)animation{
    
    [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    
    self.selectedSection = indexPath.section;
    
    if (self.handleAction) {
        self.handleAction(self, indexPath);
    }
    
    if ([self.delegate respondsToSelector:@selector(cyclePageMenu:didSelectItemAtIndexPath:)]) {
        [self.delegate cyclePageMenu:self didSelectItemAtIndexPath:indexPath];
    }
    
    if (animation) {
        [UIView animateWithDuration:0.25 animations:^{
            [self layoutSubviews];
        }];
    } else {
        [self layoutSubviews];
    }

    if (self.lastSelectedSection != indexPath.section) {
        [collectionView deselectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:self.lastSelectedSection] animated:YES];
    }

    self.lastSelectedSection = indexPath.section;

}


- (void)registerCellClass:(Class)cellClass{
    self.cellIdentifier = NSStringFromClass(cellClass);
    [self.collectionView registerClass:cellClass forCellWithReuseIdentifier:self.cellIdentifier];
}

- (void)registerSlideViewClass:(Class)slideViewClass{
    self.cyclePageSlideView = [[slideViewClass alloc] initWithFrame:CGRectZero];
    [self addSubview:self.cyclePageSlideView];
}

- (void)registerSeparatorViewClass:(Class)separatorViewClass{
    self.separatorIdentifier = NSStringFromClass(separatorViewClass);
    [self.collectionView registerClass:separatorViewClass forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass(separatorViewClass)];
}

- (void)reloadData:(NSArray *)data{
    self.dataSource = [NSMutableArray arrayWithArray:data];
    [self.collectionView reloadData];
    
}

- (void)reloadData{
    NSMutableArray *sections = [NSMutableArray array];
    for (NSString *title in self.titles) {
        NSArray *section = @[title];
        [sections addObject:section];
    }
    self.dataSource = [NSMutableArray arrayWithArray:sections.copy];
    [self.collectionView reloadData];
}

- (void)registerDefaultClass{
    [self registerSlideViewClass:[CTCyclePageSlideView class]];
    [self registerCellClass:[CTCyclePageCell class]];
    [self registerSeparatorViewClass:[CTCyclePageSeparatorView class]];
}

- (void)selectSection:(NSInteger)section animation:(BOOL)animation{
    NSAssert(section < self.dataSource.count, @"section not find");
    [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:section] animated:animation scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
    [self p_collectionView:self.collectionView didSelectItemAtIndexpath:[NSIndexPath indexPathForItem:0 inSection:section] animation:animation];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self layoutSubviews];
}

- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (CTCyclePageFlowLayout *)flowLayout{
    if (_flowLayout == nil) {
        _flowLayout = [[CTCyclePageFlowLayout alloc] init];
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return _flowLayout;
}


@end
