//
//  PJInformationLatestCell.m
//  ZHD1.0
//
//  Created by hamigua on 14-7-15.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "PJInformationCell.h"

@interface PJInformationCell ()
{
    UIView *_bgView;
    UIView *_topView;            //作者背景
    
    UIView *_bottonView;        //内容背景
    UIImageView *_imgV;         //图片
    UILabel *_titleLab;         //资讯标题
    UIImageView *_infoTypeImg;  //资讯类型标志
    UILabel *_timeLab;          //时间
}

@end

@implementation PJInformationCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(ZHSysSpaceMiddle, ZHSysSpaceMiddle, self.width - (ZHSysSpaceMiddle * 2), self.height - ZHSysSpaceMiddle)];
        _bgView.backgroundColor = [UIColor yellowColor];
        [self addSubview:_bgView];
        
        _bottonView = [[UIView alloc] initWithFrame:_bgView.bounds];
        _bottonView.backgroundColor = [UIColor whiteColor];
        [_bgView addSubview:_bottonView];
        
        CGSize imgSize = CGSizeMake(80, 60);
        _imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imgSize.width, imgSize.height)];
        _imgV.right = _bottonView.right;
        _imgV.top = _bottonView.top;
        _imgV.backgroundColor = [UIColor greenColor];
        [_bottonView addSubview:_imgV];
        
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(ZHSysSpaceMiddle, ZHSysSpaceMiddle, _bottonView.width - (_imgV.width + (3 * ZHSysSpaceMiddle)), 50)];
        [_titleLab setLabelStyleTextColor:[UIColor blackColor] fontSize:17];
        _titleLab.backgroundColor = [UIColor whiteColor];
        _titleLab.numberOfLines = 2;
        _titleLab.lineBreakMode = NSLineBreakByWordWrapping;
        [_bottonView addSubview:_titleLab];
        
        _infoTypeImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 36, 15)];
        _infoTypeImg.backgroundColor = [UIColor yellowColor];
        [_bottonView addSubview:_infoTypeImg];
        
        _timeLab = [[UILabel alloc] initWithFrame:CGRectZero];
        [_timeLab setLabelStyleTextColor:[UIColor lightGrayColor] fontSize:ZHSysFontSizeSmall];
        [_bottonView addSubview:_timeLab];
    }
    return self;
}

- (void)setItem:(NSDictionary *)item
{
    NSLog(@"124dgfhgff");
    _imgV.image = [UIImage imageNamed:@"find03"];
    _titleLab.text = @"孤独九剑保你不被互联网颠覆";
    _infoTypeImg.image = [UIImage imageNamed:@"info_exclusive_icon"];
    _timeLab.text = @"16 小时前";
    [self setLayout];
}

- (void)setLayout
{
    [_titleLab sizeToFitNumberOfLines];
    [_timeLab sizeToFit];
    
    _imgV.top = ZHSysSpaceMiddle;
    _imgV.right = _bottonView.right - ZHSysSpaceMiddle;
    _infoTypeImg.left = _titleLab.left;
    _infoTypeImg.top = _titleLab.bottom + ZHSysSpaceSmall;
    _timeLab.right = _titleLab.right;
    _timeLab.bottom = _infoTypeImg.bottom;
}

- (void)layoutSubviews
{
    _bgView.height = self.height - 10;
    _bottonView.height = _bgView.height - _topView.height;
    
}


@end
