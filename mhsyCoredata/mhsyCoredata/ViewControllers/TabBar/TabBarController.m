//
//  TabBarController.m
//  mhsyCoredata
//
//  Created by HANSHAOWEN on 17/1/23.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TabBarController.h"
#import "SkillListViewController.h"
#import "PartnerListViewController.h"
#import "PetListViewController.h"
#import "JobListViewController.h"


@interface TabBarController ()

@end


@implementation TabBarController

-(instancetype) init{
    self = [super init];
    if (self)
    {
        
        JobListViewController *cateViewController = [[JobListViewController alloc] init];
        UINavigationController *cateNavigationController = [[UINavigationController alloc] initWithRootViewController:cateViewController];
        cateNavigationController.title = TitleJobList;
        
        PetListViewController *cateViewController1 = [[PetListViewController alloc] init];
        UINavigationController *cateNavigationController1 = [[UINavigationController alloc] initWithRootViewController:cateViewController1];
        cateNavigationController1.title = TitlePetList;
        
        PartnerListViewController *cateViewController2 = [[PartnerListViewController alloc] init];
        UINavigationController *cateNavigationController2 = [[UINavigationController alloc] initWithRootViewController:cateViewController2];
        cateNavigationController2.title = TitlePartnerList;
        
        SkillListViewController *cateViewController3 = [[SkillListViewController alloc] init];
        UINavigationController *cateNavigationController3 = [[UINavigationController alloc] initWithRootViewController:cateViewController3];
        cateNavigationController3.title = TitleSkillList;
        
        [self setViewControllers:@[cateNavigationController, cateNavigationController1, cateNavigationController2, cateNavigationController3]];
        
        [self setupTabBar];
    }
    return self;
}


- (void)setupTabBar {
    NSArray *tabBarItemImageNames = @[@"tab_home", @"tab_read", @"tab_music", @"tab_movie"];
    NSInteger index = 0;
    
    for (UIViewController *vc in self.viewControllers) {
        NSString *normalImageName =  [NSString stringWithFormat:@"%@_normal", [tabBarItemImageNames objectAtIndex:index]];
        NSString *selectedImageName = [NSString stringWithFormat:@"%@_selected", [tabBarItemImageNames objectAtIndex:index]];
        UIImage *normalImage = [UIImage imageNamed:normalImageName];
        UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
        
        vc.tabBarItem.image = normalImage;
        vc.tabBarItem.selectedImage = selectedImage;
        
        index++;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 - (void)createCacheFilesFolder {
 NSString *cacheFilesFolderPath = [NSString stringWithFormat:@"%@/%@", DocumentsDirectory, MLBCacheFilesFolderName];
 NSFileManager *fileManager = [NSFileManager defaultManager];
 BOOL isDir = NO;
 BOOL isDirExist = [fileManager fileExistsAtPath:cacheFilesFolderPath isDirectory:&isDir];
 
 if(!(isDirExist && isDir)) {
 [fileManager createDirectoryAtPath:cacheFilesFolderPath withIntermediateDirectories:YES attributes:nil error:nil];
 }
 }
 */

@end
