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
#import "TablePetHeaderView.h"
#import "TableHeaderView.h"

@interface PetDetailViewController() <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic, assign) NSInteger petIndex;

@end

@implementation PetDetailViewController{
    AppDelegate *appDelegate;
    NSArray *petNames;
    NSArray *petAttrbutes;
    NSArray *petGet;
    NSArray *petSkills;
    NSArray *petRandomSKills;
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
    
    petNames = PET_LIST_NAMES;
    petAttrbutes = PET_LIST_ATTRBUTE;
    petGet = PET_LIST_GET;
    petSkills = PET_LIST_SKILL;
    petRandomSKills = PET_LIST_RANDOM_SKILL;
    
}

- (void)setupViews {
    _tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.backgroundColor = DMViewControllerBGColor;
        tableView.dataSource = self;
        tableView.delegate = self;
        
        [tableView registerClass:[TablePetHeaderView class] forHeaderFooterViewReuseIdentifier:kTablePetHeaderViewID];
        [tableView registerClass:[TableHeaderView class] forHeaderFooterViewReuseIdentifier:kTableHeaderViewID];
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
    NSUInteger skillNum = ((NSArray*)petSkills[_petIndex]).count;
    NSUInteger randomSkillNum = ((NSArray*)petRandomSKills[_petIndex]).count;
    if (skillNum != 0 && randomSkillNum != 0){
        return 3;
    }else if (skillNum != 0 || randomSkillNum != 0){
        return 2;
    }else{
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSUInteger skillNum = ((NSArray*)petSkills[_petIndex]).count;
    NSUInteger randomSkillNum = ((NSArray*)petRandomSKills[_petIndex]).count;
    switch (section){
        case 0:
            return 0;
            break;
        case 1:
            return skillNum;
            break;
        case 2:
            return randomSkillNum;
            break;
        default:
            return 1;
            break;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *skill = (NSArray*)petSkills[_petIndex];
    NSArray *randomSkill = (NSArray*)petRandomSKills[_petIndex];
    NSString *skillName = [[NSString alloc] init];
    
    if (indexPath.section == 1){
        skillName = skill[indexPath.row];
    }else if(indexPath.section == 2){
        skillName = randomSkill[indexPath.row];
    }
    TablePetDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:kTablePetDetailCellID forIndexPath:indexPath];
    
    [cell setSkillName:skillName];
    return cell;
}


#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0){
        return [TablePetHeaderView viewHeight];
    }else{
        return [TableHeaderView viewHeight];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0){
        TablePetHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kTablePetHeaderViewID];
    
        [view setPetName:petNames[_petIndex] attrbute:petAttrbutes[_petIndex] get:petGet[_petIndex] skill:petSkills[_petIndex] randSkill:petRandomSKills[_petIndex]];
        return view;
    }else{
        TableHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kTableHeaderViewID];
        
        view.titleLabel.text = (section == 1 ? @"宠物绑定技能" : @"宠物随机技能");
        return view;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)setPartnerIndex:(NSInteger)index{
    _petIndex = index;
}
@end
