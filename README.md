# CTCyclePageMenu

CTCyclePageMenu 是一个简单的模块选择菜单

## 预览
![image](https://github.com/carvertime/CTCyclePageMenu/blob/master/CTCyclePageMenuDemo/Resource/CTCyclePageMenu.gif)

## 示例

```objc
@implementation DemoVC

#pragma mark - 初始化CTCyclePageMenu

- (void)viewDidLoad {
    [super viewDidLoad];
    self.menu = [[CTCyclePageMenu alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 44)];
    [self.menu registerCellClass:NSClassFromString(@"CTHorizontalCell")];
    [self.menu registerSlideViewClass:NSClassFromString(@"CTHorizontalSlideView")];
    [self.menu registerSeparatorViewClass:NSClassFromString(@"CTHorizontalSeparatorView")];
    self.menu.titles = @[@"title1", @"title2", @"title3", @"title4", @"title5", @"title6"];
    [self.view addSubview:self.menu];
}

#pragma mark - 新建一个类CTHorizontalCell

@interface CTHorizontalCell : UICollectionViewCell<CTCyclePageCellProtocol>
@property (nonatomic, strong) UILabel *titleLb;
@end

@implementation CTHorizontalCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
         self.titleLb = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:self.titleLb];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.titleLb.frame = self.bounds;
}

// 实现CTCyclePageCellProtocol协议方法 返回CTHorizontalCell的size
+ (CGSize)cellSizeWithData:(id)aData collectionViewSize:(CGSize)collectionViewSize indexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100, 40);
}

// 实现CTCyclePageCellProtocol协议方法 更新数据
- (void)updateCellWithData:(id)aData indexPath:(NSIndexPath *)indexPath{
    self.titleLb.text = aData;
}

#pragma mark - 新建一个类CTHorizontalSlideView

@interface CTHorizontalSlideView : UIView<CTCyclePageSlideViewProtocol>

@end

@implementation CTHorizontalSlideView

// 实现CTCyclePageSlideViewProtocol协议方法 返回CTHorizontalSlideView的size
- (CGSize)slideSizeWithData:(id)aData collectionViewSize:(CGSize)collectionViewSize indexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100, 2);
}

#pragma mark - 新建一个类CTHorizontalSeparatorView

@interface CTHorizontalSeparatorView : UICollectionReusableView<CTCyclePageSeparatorProtocol>

@end

@implementation CTHorizontalSeparatorView

// 实现CTCyclePageSeparatorProtocol协议方法 返回CTHorizontalSeparatorView的size
+ (CGSize)separatorSizeWithData:(id)aData collectionViewSize:(CGSize)collectionViewSize{
    return CGSizeMake(2, 20);
}

```
