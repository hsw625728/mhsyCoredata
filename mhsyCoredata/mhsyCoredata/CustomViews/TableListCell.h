//
//  TableListCell.h
//  mhsyCoredata
//
//  Created by HANSHAOWEN on 17/1/24.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#ifndef TableListCell_h
#define TableListCell_h

#import "BaseCell.h"

FOUNDATION_EXPORT NSString *const kTableListCellID;


@interface TableListCell : BaseCell

+ (CGFloat)cellHeight;

- (void)configureCellWithTitle:(NSString *)title imageName:(NSString *)imageName atIndexPath:(NSIndexPath *)indexPath;

@end

#endif /* TableListCell_h */
