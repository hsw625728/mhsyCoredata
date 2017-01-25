//
//  TableSkillDetailCell.m
//  mhsyCoredata
//
//  Created by HANSHAOWEN on 17/1/24.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableSkillDetailCell.h"
#import "View+MASAdditions.h"

NSString *const kTableSkillDetailCellID = @"kTableSkillDetailCellID";

@interface TableSkillDetailCell ()

@property (strong, nonatomic) UIImageView *leftImageView;
@property (strong, nonatomic) UILabel *labelName;
@property (strong, nonatomic) UILabel *labelDesc;

@end

@implementation TableSkillDetailCell

#pragma mark - Class Method

+ (CGFloat)cellHeight {
    return 100;
}

#pragma mark - View Lifecycle

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setupViews];
    }
    
    return self;
}

- (void)prepareForReuse {
    [super prepareForReuse];
}

#pragma mark - Private Method

- (void)setupViews {
    const int ICON_WIDE = 50;
    const int ICON_HEIGH = 50;
    
    self.backgroundColor = [UIColor whiteColor];
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    CGFloat contentViewWidth = CGRectGetWidth([UIScreen mainScreen ].applicationFrame);
    //CGFloat lableX = ICON_WIDE + 8*2;
    const float WIDTH = contentViewWidth/16;
    _leftImageView = ({
        UIImageView *imageView = [UIImageView new];
        imageView.contentMode = UIViewContentModeCenter;
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.sizeOffset(CGSizeMake(ICON_WIDE, ICON_HEIGH));
            make.top.equalTo(self.contentView).offset(1);
            make.left.equalTo(self.contentView).offset(8);
        }];
        
        imageView;
    });
    
    _labelName = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(30);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(1);
            make.left.equalTo(self.contentView).offset(ICON_WIDE + 16);
        }];
        
        label;
    });
    
    
    _labelDesc = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(16);
        label.textColor = DMLightBlackTextColor;
        label.numberOfLines = 3;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(51);
            make.left.equalTo(self.contentView).offset(8);
        }];
        
        label;
    });
    
    UIImageView *forwardView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"forward_info"]];
    [self.contentView addSubview:forwardView];
    [forwardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.sizeOffset(CGSizeMake(6, 10));
        make.centerY.equalTo(self.contentView);
        //make.left.greaterThanOrEqualTo(_titleLabel.mas_right).offset(8);
        make.right.equalTo(self.contentView).offset(-8);
    }];
}

-(void)setImage:(NSString*)i name:(NSString*)n desc:(NSString*)d
{
    _leftImageView.image = [UIImage imageNamed:i];
    _labelName.text = n;
    _labelDesc.text = d;
}

@end
