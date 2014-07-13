//
//  ZHClanCell.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-13.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHClanCell.h"
#import "ZHClanModel.h"

@interface ZHClanCell ()
{
    UIImageView *_imgView;      //头像
    UIImageView *_iconIV;       //部落标志
    UILabel *_clanNameLab;      //部落名字
    UILabel *_memberNumLab;     //部落成员数量
    UILabel *_lastWordLab;      //最后一句发言
}

@end

@implementation ZHClanCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        CGFloat side = 40;
        _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(ZHSysSpaceMiddle, ZHSysSpaceMiddle, side, side)];
        _imgView.layer.masksToBounds = YES;
        _imgView.layer.cornerRadius = side/2;
        [self addSubview:_imgView];
        
        _iconIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 15)];
        _iconIV.image = [UIImage imageNamed:@"info_spread_icon"];
        _iconIV.hidden = YES;
        [self addSubview:_iconIV];
        
        _clanNameLab = [[UILabel alloc] initWithFrame:CGRectMake(_imgView.right + ZHSysSpaceLarge, ZHSysSpaceMiddle, 200, 50)];
        _clanNameLab.textColor = [UIColor blackColor];
        _clanNameLab.font = [UIFont systemFontOfSize:16];
        [self addSubview:_clanNameLab];
        
        _memberNumLab = [[UILabel alloc] initWithFrame:CGRectMake(0, ZHSysSpaceMiddle, 200, 50)];
        [_memberNumLab setLabelStyleTextColor:[UIColor darkGrayColor] fontSize:ZHSysFontSizeMiddle];
        [self addSubview:_memberNumLab];
        
        _lastWordLab = [[UILabel alloc] initWithFrame:CGRectMake(_clanNameLab.left, 0, self.width - (_imgView.width + (ZHSysSpaceMiddle * 2)), 20)];
        [_lastWordLab setLabelStyleTextColor:[UIColor darkGrayColor] fontSize:ZHSysFontSizeMiddle];
        [self addSubview:_lastWordLab];
    }
    return self;
}

- (void)setItem:(ZHClanModel *)item
{
    _iconIV.hidden = _memberNumLab.hidden = YES;
    _imgView.image = [UIImage imageNamed:item.cPhotoPaht];
    _lastWordLab.text = [NSString stringWithFormat:@"%@:%@",item.cLastWorder,item.cLastWord];
    _clanNameLab.text = item.cName;
    _memberNumLab.text = [NSString stringWithFormat:@"(%d)",item.cMemberCount];
    if (!item.cIsSysClan) {
        _iconIV.hidden = _memberNumLab.hidden = NO;
    }
    if (!item.cIsSysClan || !item.cLastWorder) {
        _lastWordLab.text = item.cIntroduce;
    }
    [self setLayout];
}

- (void)setLayout
{
    [_clanNameLab sizeToFit];
    [_memberNumLab sizeToFit];
    _memberNumLab.left = _clanNameLab.right + ZHSysSpaceSmall;
    _lastWordLab.top = _clanNameLab.bottom + ZHSysSpaceSmall;
    _iconIV.center = CGPointMake(_imgView.centerX, _imgView.bottom);
    
}

@end
