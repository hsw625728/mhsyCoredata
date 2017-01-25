//
//  TableSkillDetailCell.h
//  mhsyCoredata
//
//  Created by HANSHAOWEN on 17/1/24.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#ifndef TableSkillDetailCell_h
#define TableSkillDetailCell_h

#import "BaseCell.h"

FOUNDATION_EXPORT NSString *const kTableSkillDetailCellID;


@interface TableSkillDetailCell : BaseCell

+ (CGFloat)cellHeight;
-(void)setImage:(NSString*)i name:(NSString*)n desc:(NSString*)d;

@end

#endif /* TableSkillDetailCell_h */
