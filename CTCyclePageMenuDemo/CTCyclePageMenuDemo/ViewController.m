//
//  ViewController.m
//  CTCyclePageMenuDemo
//
//  Created by wenjie on 2017/8/4.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import "ViewController.h"
#import "CTCyclePageMenu.h"

@interface ViewController ()<CTCyclePageMenuProtocol>

@property (nonatomic, strong) CTCyclePageMenu *menu;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.menu = [[CTCyclePageMenu alloc] initWithFrame:CGRectMake(0, 22, [UIScreen mainScreen].bounds.size.width, 44)];
    [self.menu registerDefaultClass];
    self.menu.titles = @[@"title1",@"title2",@"title3",@"title4",@"title5",@"title6"];
    [self.view addSubview:self.menu];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.menu selectSection:4 animation:YES];
}

- (void)cyclePageMenu:(CTCyclePageMenu *)cyclePageMenu didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"indexPath = %@",indexPath);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
