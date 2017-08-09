//
//  Demo1VC.m
//  CTCyclePageMenuDemo
//
//  Created by wenjie on 2017/8/9.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import "Demo1VC.h"
#import "CTCyclePageMenu.h"
#import "ViewController.h"

@interface Demo1VC ()<CTCyclePageMenuProtocol>

@property (nonatomic, strong) CTCyclePageMenu *menu;

@end

@implementation Demo1VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"垂直菜单";
    self.view.backgroundColor = [UIColor whiteColor];
    self.menu = [[CTCyclePageMenu alloc] initWithFrame:CGRectMake(0, 64, 50, [UIScreen mainScreen].bounds.size.height - 64)];
    self.menu.scrollDirection = UICollectionViewScrollDirectionVertical;
    [self.menu registerCellClass:NSClassFromString(@"CTVerticalCell")];
    [self.menu registerSlideViewClass:NSClassFromString(@"CTVerticalSlideView")];
    [self.menu registerSeparatorViewClass:NSClassFromString(@"CTVerticalSeparatorView")];
    self.menu.delegate = self;
    self.menu.automaticallyAdjustsMenu = YES;
    self.menu.titles = @[@"title1", @"title2", @"push", @"title4", @"title5", @"title6"];
    [self.view addSubview:self.menu];
}

- (void)cyclePageMenu:(CTCyclePageMenu *)cyclePageMenu didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *VC = [ViewController new];
    if (indexPath.section == 2) {
        [self.navigationController pushViewController:VC animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
