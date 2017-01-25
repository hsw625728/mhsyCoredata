//
//  PetListViewController.m
//  mhsyCoredata
//
//  Created by HANSHAOWEN on 17/1/24.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "View+MASAdditions.h"
#import "UIImage+Common.h"
#import "PetListViewController.h"
#import "PetDetailViewController.h"
#import "TableListCell.h"
#import "TableHeaderView.h"

@interface PetListViewController() <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation PetListViewController{
    AppDelegate *appDelegate;
    NSArray *petListNames;
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
    petListNames = PET_LIST_NAMES;
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
    return petListNames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableListCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableListCellID forIndexPath:indexPath];
    
    [cell configureCellWithTitle:petListNames[indexPath.row] imageName:[NSString stringWithFormat:@"%@_small", petListNames[indexPath.row]] atIndexPath:indexPath];
    return cell;}


#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [TableHeaderView viewHeight];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    TableHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kTableHeaderViewID];
    
    view.titleLabel.text = @"宠物列表";
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PetDetailViewController *viewController = [[PetDetailViewController alloc] init];
    
    [viewController setPetName:petListNames[indexPath.row]];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
