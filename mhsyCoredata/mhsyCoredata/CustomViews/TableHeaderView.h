//
//  TableHeaderView.h
//  mhsyCoredata
//
//  Created by HANSHAOWEN on 17/1/24.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#ifndef TableHeaderView_h
#define TableHeaderView_h

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT NSString *const kTableHeaderViewID;

@interface TableHeaderView : UITableViewHeaderFooterView

+ (CGFloat)viewHeight;

@property (strong, nonatomic) UILabel *titleLabel;

@end

#endif /* TableHeaderView_h */
