//
//  TablePetDetailCell.m
//  mhsyCoredata
//
//  Created by HANSHAOWEN on 17/1/24.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TablePetDetailCell.h"
#import "View+MASAdditions.h"

NSString *const kTablePetDetailCellID = @"kTablePetDetailCellID";

@interface TablePetDetailCell ()

@property (strong, nonatomic) UIImageView *leftImageView;
@property (strong, nonatomic) UILabel *labelName;
@property (strong, nonatomic) UILabel *labelDesc;

@end

@implementation TablePetDetailCell

#pragma mark - Class Method

+ (CGFloat)cellHeight {
    return 52;
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
            //make.size.equalTo(self.contentView);//(CGSizeMake(ICON_WIDE, ICON_HEIGH));
            make.top.equalTo(self.contentView);
            make.left.equalTo(self.contentView);
            //make.right.equalTo(self.contentView);
        }];
        
        imageView;
    });
    
    _labelName = ({
        UILabel *label = [UILabel new];
        //label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(16);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(1);
            make.left.equalTo(self.contentView).offset(ICON_WIDE + 16);
            make.right.equalTo(self.contentView).offset(-8);
        }];
        
        label;
    });
    
    _labelDesc = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(9);
        label.textColor = DMLightBlackTextColor;
        label.numberOfLines = 2;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_labelName).offset(22);
            make.left.equalTo(_labelName);
            make.right.equalTo(_labelName);
        }];
        
        label;
    });
    
}

-(void)setSkillName:(NSString*)n{
    _leftImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_small", n]];
    if ([n isEqualToString:@""]){
        _labelName.text = @"无此类型技能";
    }else{
        _labelName.text = n;
    }
    
    AppDelegate *appDelegate =  (AppDelegate *) [[UIApplication sharedApplication] delegate];
    _labelDesc.text = [appDelegate.petSkillDesc objectForKey:n];
}

@end
