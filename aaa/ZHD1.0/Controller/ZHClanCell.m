//
//  ZHClanCell.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-13.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHClanCell.h"

@interface ZHClanCell ()
{
    UIImageView *_imgView;  //头像
    UILabel *_clanNameLab;      //名字
    UILabel *_numLab;       //回答问题数量
    UILabel *_companyLab;   //公司及职务
}

@end

@implementation ZHClanCell

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
