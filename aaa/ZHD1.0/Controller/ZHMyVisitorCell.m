//
//  ZHMyVisitorCell.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-3.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHMyVisitorCell.h"
#import "PJUserModel.h"

#define kHEIGHT 80

@interface ZHMyVisitorCell ()
{
    UIImageView *_headImageV;   //访客头像
    UILabel *_visitorNameLab;   //访客姓名
    UILabel *_companyNameLab;   //访客公司及头衔
    UILabel *_visitorTimeLab;   //访问时间
}

@end

@implementation ZHMyVisitorCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.frame = CGRectMake(0, 0, self.width, kHEIGHT);
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        //头像
        _headImageV = [[UIImageView alloc] initWithFrame:CGRectMake(ZHSysSpaceMiddle, ZHSysSpaceLarge, kHEIGHT - (ZHSysSpaceLarge * 2), kHEIGHT - (ZHSysSpaceLarge * 2))];
        [self addSubview:_headImageV];
        //公司及头衔
        _companyNameLab = [[UILabel alloc] initWithFrame:CGRectMake(_headImageV.right + ZHSysSpaceMiddle, 0, self.width - (_headImageV.right + ZHSysSpaceMiddle + ZHSysSpaceLarge), self.height - (ZHSysSpaceMiddle * 2))];
        [_companyNameLab setLabelStyleTextColor:[UIColor darkGrayColor] fontSize:ZHSysFontSizeLarge];
        [self addSubview:_companyNameLab];
        
        //名字
        _visitorNameLab = [[UILabel alloc] initWithFrame:_companyNameLab.bounds];
        [_visitorNameLab setLabelStyleTextColor:[UIColor blackColor] fontSize:ZHSysFontSizeLarge];
        _visitorNameLab.width = 135;
        _visitorNameLab.numberOfLines = 2;
        _visitorNameLab.lineBreakMode = NSLineBreakByCharWrapping;
        [self addSubview:_visitorNameLab];
        
        //时间
        _visitorTimeLab = [[UILabel alloc] initWithFrame:_companyNameLab.bounds];
        [_visitorTimeLab setLabelStyleTextColor:[UIColor darkGrayColor] fontSize:ZHSysFontSizeMiddle];
        [self addSubview:_visitorTimeLab];
        
    }
    return self;
}

- (void)setItem:(PJUserModel *)item
{
    _headImageV.image = [UIImage imageNamed:item.uPicPath];
    _companyNameLab.text = item.uCompany;
    _companyNameLab.height = 18;
    _visitorNameLab.text = [NSString stringWithFormat:@"%@ 看过了您的个人名片",item.uName];
    [_visitorNameLab sizeToFitNumberOfLines];
    _visitorTimeLab.text = [NSDate getFormatTime:[NSDate date] format:@"MM-dd hh:mm"];
    [_visitorTimeLab sizeToFit];
}

- (void)layoutSubviews{
    _companyNameLab.bottom = 80 - ZHSysSpaceMiddle;
    _visitorNameLab.top = ZHSysSpaceMiddle;
    _visitorNameLab.left = _companyNameLab.left;
    _visitorTimeLab.top = _visitorNameLab.top;
    _visitorTimeLab.right = self.width - ZHSysSpaceLarge;
}

@end
