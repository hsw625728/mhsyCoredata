//
//  TableJobHeaderView.h
//  mhsyCoredata
//
//  Created by HANSHAOWEN on 17/2/3.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#ifndef TableJobHeaderView_h
#define TableJobHeaderView_h

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT NSString *const kTableJobHeaderViewID;

@interface TableJobHeaderView : UITableViewHeaderFooterView

+ (CGFloat)viewHeight;

@property (strong, nonatomic) UILabel *titleLabel;

@end

#endif /* TableJobHeaderView_h */
