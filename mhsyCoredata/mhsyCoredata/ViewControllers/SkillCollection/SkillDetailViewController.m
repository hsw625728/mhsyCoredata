//
//  SkillDetailViewController.m
//  mhsyCoredata
//
//  Created by HANSHAOWEN on 17/1/24.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "View+MASAdditions.h"
#import "UIImage+Common.h"
#import "SkillDetailViewController.h"
#import "TableSkillDetailCell.h"
#import "TableHeaderView.h"

@interface SkillDetailViewController() <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic, assign) NSInteger skillIndex;

@end

@implementation SkillDetailViewController{
    AppDelegate *appDelegate;
    NSArray *skillImage;
    NSArray *skillName;
    NSArray *skillDesc;
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
    
    self.navigationItem.title = TitleSkillList;
    
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
    skillImage = SKILL_LIST_NAMES;
    skillName = SKILL_LIST_NAMES;
    skillDesc = SKILL_LIST_DESC;
}

- (void)setupViews {
    _tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.backgroundColor = DMViewControllerBGColor;
        tableView.dataSource = self;
        tableView.delegate = self;
        
        //[tableView registerClass:[DMTableHeaderView class] forHeaderFooterViewReuseIdentifier:kDMTableHeaderViewID];
        [tableView registerClass:[TableSkillDetailCell class] forCellReuseIdentifier:kTableSkillDetailCellID];
        
        tableView.rowHeight = [TableSkillDetailCell cellHeight];
        
        
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
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableSkillDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableSkillDetailCellID forIndexPath:indexPath];
    
    [cell setImage:[NSString stringWithFormat:@"%@_small", skillImage[_skillIndex]] name:skillName[_skillIndex] desc:skillDesc[_skillIndex]];
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
}

-(void)setSkillIndex:(NSInteger)index{
    _skillIndex = index;
}
@end
