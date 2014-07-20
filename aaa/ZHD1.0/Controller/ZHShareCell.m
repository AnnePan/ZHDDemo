//
//  ZHShareCell.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-19.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHShareCell.h"

#define kUSERIMG_WEITH 40
#define kIMGS_WEITH 70
#define kSHARETEXT_WEITH (self.width - (_userImg.width + (ZHSysSpaceMiddle * 3)))

@interface ZHShareCell()
{
    UIImageView *_userImg;
    
    UIButton *_sharerNameBtn;
    UILabel *_timeLab;
    
    UILabel *_shareTextLab;
    UIView *_imgsView;
    UIButton *_transforBtn;
    UIButton *_addMaonyBtn;
}

@end

@implementation ZHShareCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _userImg = [[UIImageView alloc] initWithFrame:CGRectMake(ZHSysSpaceMiddle, ZHSysSpaceMiddle, kUSERIMG_WEITH, kUSERIMG_WEITH)];
        _userImg.layer.masksToBounds = YES;
        _userImg.layer.cornerRadius = _userImg.width / 2;
        [self addSubview:_userImg];
        
        _sharerNameBtn = [[UIButton alloc] initWithFrame:CGRectMake(_userImg.width + (ZHSysSpaceMiddle * 2), ZHSysSpaceSmall, 80, 20)];
        [_sharerNameBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        _sharerNameBtn.titleLabel.font = [UIFont systemFontOfSize:ZHSysFontSizeLarge];
        [self addSubview:_sharerNameBtn];
        
        _timeLab = [[UILabel alloc] initWithFrame:_sharerNameBtn.bounds];
        [_timeLab setLabelStyleTextColor:[UIColor grayColor] fontSize:ZHSysFontSizeSmall];
        [self addSubview:_timeLab];
        
        _shareTextLab = [[UILabel alloc] initWithFrame:CGRectMake(_sharerNameBtn.left, _sharerNameBtn.bottom + ZHSysSpaceMiddle, kSHARETEXT_WEITH, 30)];
        _shareTextLab.numberOfLines = 11;
        _shareTextLab.lineBreakMode = NSLineBreakByWordWrapping;
        [_shareTextLab setLabelStyleTextColor:[UIColor blackColor] fontSize:ZHSysFontSizeLarge];
        [self addSubview:_shareTextLab];
        
        _transforBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
        [_transforBtn setImage:[UIImage imageNamed:@"eed_detail_zhuanping"] forState:UIControlStateNormal];
        [_transforBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        _transforBtn.titleLabel.font = [UIFont systemFontOfSize:ZHSysFontSizeSmall];
        [self addSubview:_transforBtn];
        
        _addMaonyBtn =[[UIButton alloc] initWithFrame:_transforBtn.bounds];
        [_addMaonyBtn setImage:[UIImage imageNamed:@"eed_detail_zhuanping"] forState:UIControlStateNormal];
        [_addMaonyBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        _addMaonyBtn.titleLabel.font = [UIFont systemFontOfSize:ZHSysFontSizeSmall];
        [_addMaonyBtn setTitle:@"加金" forState:UIControlStateNormal];
        [self addSubview:_addMaonyBtn];
    }
    return self;
}

- (void)setItem:(NSDictionary *)item
{
    _userImg.image = [UIImage imageNamed:@"picv5"];
    [_sharerNameBtn setTitle:@"周国锋" forState:UIControlStateNormal];
    _timeLab.text = @"3小时前";
    _shareTextLab.text = @"高考，结果打开赶紧离开的健康结，果打开结果打开了感觉到咖，感觉加快广东卡个健，康的结果看到结果打开给大家赶快点击更多可根据贷款阿里的空间佛看美女艰苦的艰苦的减肥的离开家诶，恐惧诶两卡结果IE哦啊拉开价格哦爱范。";
    [_transforBtn setTitle:[NSString stringWithFormat:@"转评 %d",3] forState:UIControlStateNormal];
    
    [self setLayout];
}

- (void)setLayout
{
    [_sharerNameBtn sizeToFit];
    [_timeLab sizeToFit];
    [_shareTextLab sizeToFitNumberOfLines];
    
    _timeLab.right = self.right - ZHSysSpaceLarge;
    _timeLab.centerY = _sharerNameBtn.centerY;
    _transforBtn.top = _shareTextLab.bottom;
    _transforBtn.left = _shareTextLab.left;
    _addMaonyBtn.top = _transforBtn.top;
    _addMaonyBtn.left = _transforBtn.right + ZHSysSpaceMiddle;
}

@end
