//
//  TablePetHeaderView.m
//  mhsyCoredata
//
//  Created by HANSHAOWEN on 17/2/3.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TablePetHeaderView.h"
#import "View+MASAdditions.h"

NSString *const kTablePetHeaderViewID = @"TablePetHeaderViewID";

@interface TablePetHeaderView ()

@property (strong, nonatomic) UIImageView *leftImageView;
@property (strong, nonatomic) UILabel *labelName;
@property (strong, nonatomic) UILabel *labelAttrbute;
@property (strong, nonatomic) UILabel *labelGet;

@end


@implementation TablePetHeaderView

+ (CGFloat)viewHeight {
    return 215;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    
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
    const int ICON_WIDE = 160;
    const int ICON_HEIGH = 213;
    
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
        label.font = FontWithSize(20);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(1);
            make.left.equalTo(self.contentView).offset(ICON_WIDE + 16);
            make.right.equalTo(self.contentView).offset(-8);
        }];
        
        label;
    });
    
    _labelGet = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        label.numberOfLines = 2;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_labelName).offset(32);
            make.left.equalTo(_labelName);
            make.right.equalTo(_labelName);
        }];
        
        label;
    });
    
    _labelAttrbute = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(10);
        label.textColor = DMLightBlackTextColor;
        label.numberOfLines = 20;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_labelGet).offset(30);
            make.left.equalTo(_labelGet);
            make.right.equalTo(_labelGet);
        }];
        
        label;
    });
    
    /*
     UIImageView *forwardView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"forward_info"]];
     [self.contentView addSubview:forwardView];
     [forwardView mas_makeConstraints:^(MASConstraintMaker *make) {
     make.size.sizeOffset(CGSizeMake(6, 10));
     make.centerY.equalTo(self.contentView);
     //make.left.greaterThanOrEqualTo(_titleLabel.mas_right).offset(8);
     make.right.equalTo(self.contentView).offset(-8);
     }];
     */
}

-(void)setPetName:(NSString*)n attrbute:(NSString*)a get:(NSString*)g skill:(NSArray*)s randSkill:(NSArray*)r
{
    _leftImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_big_small", n]];
    _labelName.text = n;
    _labelAttrbute.text = a;
    _labelGet.text = g;
}

@end
