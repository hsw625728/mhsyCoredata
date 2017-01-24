//
//  JobListViewController.m
//  mhsyCoredata
//
//  Created by HANSHAOWEN on 17/1/24.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "View+MASAdditions.h"
#import "UIImage+Common.h"
#import "JobListViewController.h"
#import "JobDetailViewController.h"
#import "TableListCell.h"
#import "TableHeaderView.h"

@interface JobListViewController() <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation JobListViewController{
    AppDelegate *appDelegate;
    NSArray *jobListItems;
    NSArray *jobListDesc;
    NSArray *jobListSkillName;
    NSArray *jobListSkillDesc;
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
    
    jobListItems = JOB_LIST_ITEMS;
    jobListDesc = JOB_LIST_SKILL_DESC;
    jobListSkillName = JOB_LIST_SKILL_NAME;
    jobListSkillDesc = JOB_LIST_SKILL_DESC;
}

- (void)setupViews {
    _tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.backgroundColor = DMViewControllerBGColor;
        tableView.dataSource = self;
        tableView.delegate = self;
        
        [tableView registerClass:[TableHeaderView class] forHeaderFooterViewReuseIdentifier:kTableHeaderViewID];
        [tableView registerClass:[TableListCell class] forCellReuseIdentifier:kTableListCellID];
        
        tableView.rowHeight = [TableListCell cellHeight];
        
        
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return jobListItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableListCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableListCellID forIndexPath:indexPath];

    [cell configureCellWithTitle:jobListItems[indexPath.row] imageName:[NSString stringWithFormat:@"%@_small", jobListItems[indexPath.row]] atIndexPath:indexPath];
     return cell;
}


#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [TableHeaderView viewHeight];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    TableHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kTableHeaderViewID];
    
    view.titleLabel.text = @"门派分类";
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    JobDetailViewController *viewController = [[JobDetailViewController alloc] init];
    
    [viewController setJobName:jobListItems[indexPath.row]];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
