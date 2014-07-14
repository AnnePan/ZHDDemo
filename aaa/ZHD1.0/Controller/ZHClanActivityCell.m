//
//  ZHClanActivityCell.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-15.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHClanActivityCell.h"

@interface ZHClanActivityCell ()
{
    UIView *_titleView;
    UILabel *_titleLab;      //标题
    
    UIView *_middleView;
    UIImageView *_imgView;  //图片
    UIImageView *_typeImg;
    UILabel *_typeLable;
    UIImageView *_timeImg;
    UILabel *_timeLab;
    UIImageView *_addressImg;
    UILabel *_addressLab;
    UIImageView *_initiateImg;
    UILabel *_initiateLab;
    
    UIView *_bottomView;
    UILabel *_signUpLab;
    UILabel *_interestLab;
    UILabel *_statusLab;
}

@end

@implementation ZHClanActivityCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
