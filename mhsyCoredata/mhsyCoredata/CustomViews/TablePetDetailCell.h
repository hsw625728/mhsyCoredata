//
//  TablePetDetailCell.h
//  mhsyCoredata
//
//  Created by HANSHAOWEN on 17/1/24.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#ifndef TablePetDetailCell_h
#define TablePetDetailCell_h

#import "BaseCell.h"

FOUNDATION_EXPORT NSString *const kTablePetDetailCellID;


@interface TablePetDetailCell : BaseCell

+ (CGFloat)cellHeight;
-(void)setPetName:(NSString*)name;

@end

#endif /* TablePetDetailCell_h */
