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
    UIView *_bgView;
    
    UIView *_titleView;
    UILabel *_titleLab;      //标题
    
    UIView *_middleView;
    UIImageView *_imgView;  //图片
    UIImageView *_fromImg;
    UILabel *_fromLable;
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
        self.backgroundColor = self.backgroundView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.05];
        _bgView  = [[UIView alloc] initWithFrame:CGRectMake(ZHSysSpaceMiddle, ZHSysSpaceLarge, self.width - (ZHSysSpaceMiddle * 2), 220 - ZHSysSpaceLarge)];
//        _bgView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_bgView];
        
        //标题部分
        _titleView = [[UIView alloc] initWithFrame:_bgView.bounds];
        _titleView.height = 35;
        _titleView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
        [_bgView addSubview:_titleView];
        
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(ZHSysSpaceMiddle, ZHSysSpaceMiddle, _titleView.width - (2 * ZHSysSpaceMiddle), _titleView.height - (2 * ZHSysSpaceMiddle))];
        [_titleLab setLabelStyleTextColor:[UIColor blackColor] fontSize:ZHSysFontSizeLarge];
        _titleLab.numberOfLines = 0;
        _titleLab.lineBreakMode = NSLineBreakByCharWrapping;
        [_titleView addSubview:_titleLab];
        
        //底部
        _bottomView = [[UIView alloc] initWithFrame:_titleView.bounds];
        _bottomView.bottom = _bgView.height;
        _bottomView.backgroundColor = [UIColor whiteColor];
        [_bgView addSubview:_bottomView];
        
        _signUpLab = [[UILabel alloc] initWithFrame:_titleLab.frame];
        [_signUpLab setLabelStyleTextColor:[UIColor blackColor] fontSize:ZHSysFontSizeMiddle];
        [_bottomView addSubview:_signUpLab];
        
        //中间部分
        _middleView = [[UIView alloc] initWithFrame:CGRectMake(0, _titleView.bottom, _titleView.width, _bgView.height - (_titleView.height + _bottomView.height))];
        _middleView.backgroundColor = [UIColor whiteColor];
        [_bgView addSubview:_middleView];
        
        CGSize imgSize = CGSizeMake(70, 80);
        _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, ZHSysSpaceMiddle, imgSize.width, imgSize.height)];
        [_middleView addSubview:_imgView];
        
        _fromLable = [[UILabel alloc] initWithFrame:CGRectMake(0, ZHSysSpaceSmall, _middleView.width - (imgSize.width + ZHSysSpaceMiddle * 2), (_middleView.height - (ZHSysSpaceSmall * 2))/4)];
        [_fromLable setLabelStyleTextColor:[UIColor blackColor] fontSize:ZHSysFontSizeMiddle];
        [_middleView addSubview:_fromLable];
        
        _timeLab = [[UILabel alloc] initWithFrame:_fromLable.bounds];
        [_timeLab setLabelStyleTextColor:[UIColor blackColor] fontSize:ZHSysFontSizeMiddle];
        [_middleView addSubview:_timeLab];
        
        _addressLab = [[UILabel alloc] initWithFrame:_fromLable.bounds];
        [_addressLab setLabelStyleTextColor:[UIColor blackColor] fontSize:ZHSysFontSizeMiddle];
        [_middleView addSubview:_addressLab];
        
        _initiateLab = [[UILabel alloc] initWithFrame:_fromLable.bounds];
        [_initiateLab setLabelStyleTextColor:[UIColor blackColor] fontSize:ZHSysFontSizeMiddle];
        [_middleView addSubview:_initiateLab];
        
    }
    return self;
}

- (void)setItem:(NSDictionary *)item
{
    _titleLab.text = @"去联合国与希尔顿家族参加宴会";
    _signUpLab.text = [NSString stringWithFormat:@"%d 人报名 ｜ %d 感兴趣",24,179];
    _imgView.image = [UIImage imageNamed:@"activityDefi"];
    _fromLable.text = [NSString stringWithFormat:@"来自：%@",@"官方"];
    _timeLab.text = [NSString stringWithFormat:@"时间：%@",@"2014-07－15 00:00"];
    _addressLab.text = [NSString stringWithFormat:@"地点：%@",@"北京国贸大酒店"];
    _initiateLab.text = [NSString stringWithFormat:@"发起人：%@",@"吴金浩"];
    
    [self setLayout];
};

- (void)setLayout
{
    _imgView.right = _middleView.right - ZHSysSpaceMiddle;
    _fromLable.left = 40;
    _timeLab.top = _titleLab.bottom;
    _timeLab.left = _fromLable.left;
    _addressLab.top = _timeLab.bottom;
    _addressLab.left = _fromLable.left;
    _initiateLab.top = _addressLab.bottom;
    _initiateLab.left = _fromLable.left;
}

@end
