//
//  TablePetHeaderView.h
//  mhsyCoredata
//
//  Created by HANSHAOWEN on 17/2/3.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#ifndef TablePetHeaderView_h
#define TablePetHeaderView_h

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT NSString *const kTablePetHeaderViewID;

@interface TablePetHeaderView : UITableViewHeaderFooterView

+ (CGFloat)viewHeight;

-(void)setPetName:(NSString*)n attrbute:(NSString*)a get:(NSString*)g skill:(NSArray*)s randSkill:(NSArray*)r;

@end

#endif /* TablePetHeaderView_h */
