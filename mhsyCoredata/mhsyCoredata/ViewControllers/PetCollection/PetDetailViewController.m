//
//  PetDetailViewController.m
//  mhsyCoredata
//
//  Created by HANSHAOWEN on 17/1/24.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "View+MASAdditions.h"
#import "UIImage+Common.h"
#import "PetDetailViewController.h"
#import "TablePetDetailCell.h"
#import "TableHeaderView.h"

@interface PetDetailViewController() <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation PetDetailViewController{
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
    
    self.navigationItem.title = TitlePetList;
    
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
        
        //[tableView registerClass:[DMTableHeaderView class] forHeaderFooterViewReuseIdentifier:kDMTableHeaderViewID];
        [tableView registerClass:[TablePetDetailCell class] forCellReuseIdentifier:kTablePetDetailCellID];
        
        tableView.rowHeight = [TablePetDetailCell cellHeight];
        
        
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
    TablePetDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:kTablePetDetailCellID forIndexPath:indexPath];
    
    //[cell setIndex:indexPath.row];
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

-(void)setMonsterName:(NSString*)name
{
    _name = name;
}
@end
