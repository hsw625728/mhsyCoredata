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
#import "TableJobHeaderView.h"

@interface JobDetailViewController() <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic, assign) NSInteger jobIndex;

@end

@implementation JobDetailViewController{
    AppDelegate *appDelegate;
    NSArray *jobListDesc;
    NSArray *jobListSkillNames;
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
    
    //[self addNavigationBarLeftSearchItem];
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
    
    jobListDesc = JOB_LIST_DESC;
    jobListSkillNames = JOB_LIST_SKILL_NAME;
    jobListSkillDesc = JOB_LIST_SKILL_DESC;
}

- (void)setupViews {
    _tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.backgroundColor = DMViewControllerBGColor;
        tableView.dataSource = self;
        tableView.delegate = self;
        
        [tableView registerClass:[TableJobHeaderView class] forHeaderFooterViewReuseIdentifier:kTableJobHeaderViewID];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((NSArray*)JOB_LIST_SKILL_NAME[_jobIndex]).count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableJobDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableJobDetailCellID forIndexPath:indexPath];

    [cell setImage:[NSString stringWithFormat:@"%@_small", jobListSkillNames[_jobIndex][indexPath.row]] name:jobListSkillNames[_jobIndex][indexPath.row] desc:jobListSkillDesc[_jobIndex][indexPath.row]];
    return cell;
}


#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [TableJobHeaderView viewHeight];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    TableJobHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kTableJobHeaderViewID];
    
    view.titleLabel.text = jobListDesc[_jobIndex];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    /*
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TableJobDetailCell *viewController = [[TableJobDetailCell alloc] init];

    [viewController setSection:_jobIndex index:indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
     */
}
-(void)setJobIndex:(NSInteger)index{
    _jobIndex = index;
}

@end
