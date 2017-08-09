//
//  Demo2VC.m
//  CTCyclePageMenuDemo
//
//  Created by wenjie on 2017/8/9.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import "Demo2VC.h"
#import "CTCyclePageMenu.h"

@interface Demo2VC ()

@property (nonatomic, strong) CTCyclePageMenu *menu;

@end

@implementation Demo2VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"水平菜单";
    self.view.backgroundColor = [UIColor whiteColor];
    self.menu = [[CTCyclePageMenu alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 44)];
    [self.menu registerCellClass:[NSClassFromString(@"CTHorizontalCell") class]];
    [self.menu registerSlideViewClass:[NSClassFromString(@"CTHorizontalSlideView") class]];
    [self.menu registerSeparatorViewClass:[NSClassFromString(@"CTHorizontalSeparatorView") class]];
    self.menu.titles = @[@"title1", @"title2", @"根据文字长度自适应title3", @"title4", @"title5", @"title6"];
    [self.view addSubview:self.menu];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
