//
//  ExampleListVC.m
//  CTCyclePageMenuDemo
//
//  Created by wenjie on 2017/8/9.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import "ExampleListVC.h"
#import "Demo1VC.h"
#import "Demo2VC.h"

@interface ExampleListVC ()

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation ExampleListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CTCyclePageMenu Example List";
    self.dataSource = @[@"竖直菜单", @"水平菜单"].mutableCopy;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:[Demo1VC new] animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:[Demo2VC new] animated:YES];
            break;
        default:
            break;
    }
}


@end
