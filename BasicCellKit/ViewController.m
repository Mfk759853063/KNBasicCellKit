//
//  ViewController.m
//  BasicCellKit
//
//  Created by vbn on 16/11/28.
//  Copyright © 2016年 vbn. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "KNBaseTableViewCell.h"
#import "KNNormalTableViewCell.h"
#import "KNChooseTableViewCell.h"
#define SCREEN_WIDTH                              [[UIScreen mainScreen]bounds].size.width
#define SCREEN_HEIGHT                             [[UIScreen mainScreen]bounds].size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@64);
        make.left.and.right.and.bottom.equalTo(self.view);
    }];
    [self.tableView registerClass:[KNNormalTableViewCell class] forCellReuseIdentifier:@"cellIdentifier"];
    [self.tableView registerClass:[KNChooseTableViewCell class] forCellReuseIdentifier:@"cellIdentifier2"];
    [self.tableView setShowsHorizontalScrollIndicator:NO];
    [self.tableView setShowsVerticalScrollIndicator:NO];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableViewDelegate && Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier2";
    KNChooseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[KNChooseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.row % 2== 0) {
        cell.iconImage = [UIImage imageNamed:@"icon_yidu"];
    } else {
        cell.iconImage = nil;
    }
    cell.titleLabel.text = @"这是标题";
    cell.descripLabel.text = @"这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述";
    return cell;
}

@end
