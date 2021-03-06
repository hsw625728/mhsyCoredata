//
//  TablePartnerDetailCell.h
//  mhsyCoredata
//
//  Created by HANSHAOWEN on 17/1/24.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#ifndef TablePartnerDetailCell_h
#define TablePartnerDetailCell_h

#import "BaseCell.h"

FOUNDATION_EXPORT NSString *const kTablePartnerDetailCellID;


@interface TablePartnerDetailCell : BaseCell

+ (CGFloat)cellHeight;
-(void)setImage:(NSString*)i name:(NSString*)n desc:(NSString*)d;

@end

#endif /* TablePartnerDetailCell_h */
