//
//  TableJobDetailListCell.h
//  mhsyCoredata
//
//  Created by HANSHAOWEN on 17/1/24.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#ifndef TableJobDetailListCell_h
#define TableJobDetailListCell_h

#import "BaseCell.h"

FOUNDATION_EXPORT NSString *const kTableJobDetailCellID;


@interface TableJobDetailCell : BaseCell

+ (CGFloat)cellHeight;
-(void)setImage:(NSString*)i name:(NSString*)n desc:(NSString*)d;

@end

#endif /* TableJobDetailListCell_h */
