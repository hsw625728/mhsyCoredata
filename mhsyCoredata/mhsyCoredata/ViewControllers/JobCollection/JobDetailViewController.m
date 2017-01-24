//
//  JobDetailViewController.m
//  mhsyCoredata
//
//  Created by HANSHAOWEN on 17/1/24.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "View+MASAdditions.h"
#import "UIImage+Common.h"
#import "JobDetailViewController.h"
#import "TableJobDetailCell.h"
#import "TableHeaderView.h"

@interface JobDetailViewController() <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation JobDetailViewController{
    AppDelegate *appDelegate;
}

#pragma mark - Lifecycle

- (void)dealloc {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = TitleJobList;
    
    [self addNavigationBarLeftSearchItem];
    [self setupViews];
    
    //设置导航栏
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    [self initDatas];
    [self setupViews];
    
}
#pragma mark - Private Method

- (void)initDatas {
    appDelegate =  (AppDelegate *) [[UIApplication sharedApplication] delegate];
}

- (void)setupViews {
    _tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.backgroundColor = DMViewControllerBGColor;
        tableView.dataSource = self;
        tableView.delegate = self;
        
        [tableView registerClass:[TableHeaderView class] forHeaderFooterViewReuseIdentifier:kTableHeaderViewID];
        [tableView registerClass:[TableJobDetailCell class] forCellReuseIdentifier:kTableJobDetailCellID];
        
        tableView.rowHeight = [TableJobDetailCell cellHeight];
        
        
        [self.view addSubview:tableView];
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        
        tableView;
    });
}
#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //[(ParallaxHeaderView *)_tableView.tableHeaderView layoutHeaderViewForScrollViewOffset:scrollView.contentOffset];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //return appDelegate.gMonsterCategroy.count;
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //NSArray *category = [appDelegate.gMonsterCategroy allKeys];
    //NSArray *monstersName = [appDelegate.gMonsterCategroy objectForKey:category[section]];
    //return monstersName.count;
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableJobDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableJobDetailCellID forIndexPath:indexPath];
    /*
     DSSkillDetailItem *model = [[DSSkillDetailItem alloc] init];
     model.skillName = appDelegate.gSkillInfo.skillName[indexPath.section][indexPath.row];
     model.skillPoint = appDelegate.gSkillInfo.skillPoint[indexPath.section][indexPath.row];
     model.skillDesc = appDelegate.gSkillInfo.skillDesc[indexPath.section][indexPath.row];
     [(DSTableDetailCell *)cell configureCellWithSearchItem:(DSSkillDetailItem *)model];
     */
    //NSArray *category = [appDelegate.gMonsterCategroy allKeys];
    //NSArray *monstersName = [appDelegate.gMonsterCategroy objectForKey:category[indexPath.section]];
    [cell setJobName:@""];
    return cell;
}


#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [TableHeaderView viewHeight];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    TableHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kTableHeaderViewID];
    //NSArray *category = [appDelegate.gMonsterCategroy allKeys];
    //view.titleLabel.text = category[section];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TableJobDetailCell *viewController = [[TableJobDetailCell alloc] init];
    //NSArray *category = [appDelegate.gMonsterCategroy allKeys];
    //NSArray *monstersName = [appDelegate.gMonsterCategroy objectForKey:category[indexPath.section]];
    [viewController setJobName:@""];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
