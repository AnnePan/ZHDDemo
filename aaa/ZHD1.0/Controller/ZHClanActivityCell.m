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
        _bgView  = [[UIView alloc] initWithFrame:CGRectMake(ZHSysSpaceMiddle, ZHSysSpaceLarge, self.width - (ZHSysSpaceMiddle * 2), 220 - ZHSysSpaceLarge)];
        _bgView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_bgView];
        
        _titleView = [[UIView alloc] initWithFrame:_bgView.bounds];
        _titleView.height = 35;
        _titleView.backgroundColor = [UIColor redColor];
        [_bgView addSubview:_titleView];
        
        _bottomView = [[UIView alloc] initWithFrame:_titleView.bounds];
        _bottomView.bottom = _bgView.height;
        _bottomView.backgroundColor = [UIColor blueColor];
        [_bgView addSubview:_bottomView];
        
        _middleView = [[UIView alloc] initWithFrame:CGRectMake(0, _titleView.bottom, _titleView.width, _bgView.height - (_titleView.height + _bottomView.height))];
        _middleView.backgroundColor = [UIColor yellowColor];
        [_bgView addSubview:_middleView];
    }
    return self;
}

- (void)setItem:(NSDictionary *)item
{
    NSLog(@"1234pjkdjg;f");
};

@end
