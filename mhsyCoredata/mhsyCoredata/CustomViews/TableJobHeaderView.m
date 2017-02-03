//
//  TableJobHeaderView.m
//  mhsyCoredata
//
//  Created by HANSHAOWEN on 17/2/3.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableJobHeaderView.h"
#import "View+MASAdditions.h"

NSString *const kTableJobHeaderViewID = @"TableJobHeaderViewID";

@implementation TableJobHeaderView

+ (CGFloat)viewHeight {
    return 120;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setupViews];
    }
    
    return self;
}

- (void)setupViews {
    if (_titleLabel) {
        return;
    }
    
    self.contentView.backgroundColor = [UIColor colorWithRed:252 / 255.0 green:253 / 255.0 blue:254 / 255.0 alpha:1];// #FCFDFE
    
    _titleLabel = ({
        UILabel *label = [UILabel new];
        label.textColor = [UIColor colorWithWhite:127 / 255.0 alpha:1];// #7F7F7F
        label.font = FontWithSize(12);
        label.numberOfLines = 10;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.right.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 15, 0, 0));
        }];
        
        label;
    });
}

@end
