//
//  ZHGoldFireCell.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-8.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHGoldFireCell.h"
#import "PJUserModel.h"
#import "ZHThanksWordVc.h"
#import "ZHRecommendDetailVc.h"

#import "NSString+Additions.h"
@interface ZHGoldFireCell ()
{
    UIView *_bgView;
    UIImageView *_imgView; //头像
    UILabel *_nameLab;  //头像
    UILabel *_numLab;   //推荐人数
    UIButton *_actionBt;    //观看视频Btn
    UIImageView *_makeIV;   //标志
    UILabel *_contextLab;
    PJUserModel *_user;
    UIButton *_button;
}

@end

@implementation ZHGoldFireCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundView.backgroundColor = self.backgroundColor = [UIColor sysColor];
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(ZHSysSpaceLarge, ZHSysSpaceMiddle, self.width - (ZHSysSpaceLarge * 2), self.height - ZHSysSpaceMiddle)];
        _bgView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_bgView];
        
        CGFloat side = 40;
        _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(ZHSysSpaceMiddle, ZHSysSpaceMiddle, side, side)];
        _imgView.layer.masksToBounds = YES;
        _imgView.layer.cornerRadius = side/2;
        [_bgView addSubview:_imgView];
        
        _nameLab = [[UILabel alloc] initWithFrame:CGRectMake(_imgView.right + ZHSysSpaceLarge, ZHSysSpaceMiddle, 200, 50)];
        _nameLab.textColor = [UIColor blackColor];
        _nameLab.font = [UIFont systemFontOfSize:16];
        [_bgView addSubview:_nameLab];
        
        _numLab = [[UILabel alloc] initWithFrame:CGRectMake(0, ZHSysSpaceMiddle, 200, 50)];
        [_bgView addSubview:_numLab];
        
        _actionBt = [[UIButton alloc] initWithFrame:CGRectMake(_nameLab.left, 0, 80, 20)];
        _actionBt.backgroundColor = [UIColor blueColor];
        _actionBt.titleLabel.font = [UIFont systemFontOfSize:15];
        [_actionBt setTitle:@"观看视频" forState:UIControlStateNormal];
        [_actionBt addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [_bgView addSubview:_actionBt];
        
        _contextLab = [[UILabel alloc] initWithFrame:CGRectMake(ZHSysSpaceMiddle, 70, 270, 0)];
        _contextLab.textColor = [UIColor orangeColor];
        _contextLab.textAlignment = NSTextAlignmentLeft;
        [_contextLab setMinimumScaleFactor:14];
        [_contextLab setNumberOfLines:3];
        [_contextLab setFont:[UIFont systemFontOfSize:14]];
        
        [_bgView addSubview:_contextLab];
        
        _button = [[UIButton alloc] init];
        _button.backgroundColor = [UIColor clearColor];
        [_button setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(_contextBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [_bgView addSubview:_button];
        
        UIButton *tempBtn = [[UIButton alloc] initWithFrame:_contextLab.frame];
        [tempBtn addTarget:self action:@selector(_contextBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:tempBtn];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(ZHSysSpaceMiddle, _contextLab.top - ZHSysSpaceMiddle, _bgView.width - (ZHSysSpaceMiddle * 2), 0.5)];
        line.backgroundColor = [UIColor sysGrayColor];
        [_bgView addSubview:line];
    }
    return self;
}

- (void)setItem:(PJUserModel *)user
{
    _user = user;
    _imgView.image = [UIImage imageNamed:user.uPicPath];
    _nameLab.text = user.uName;
    _numLab.text = [NSString stringWithFormat:@"－推荐了%d个岛亲",[user.uFires count]];
    [_button setTitle:user.uFireDirections forState:UIControlStateNormal];
    _contextLab.text = user.uFireDirections;
    [_contextLab sizeToFitNumberOfLines];
    
    _contextLab.height = MIN([user.uFireDirections sizeWithMaxWidth:270 font:[UIFont systemFontOfSize:14]].height, 60);
    _bgView.height = _contextLab.height + 80;
    self.contentView.height = _contextLab.height + 90;
    _button.frame = _contextLab.frame;
    [self setLayout];
}

- (void)setLayout
{
    [_nameLab sizeToFit];
    [_numLab sizeToFit];
    _numLab.left = _nameLab.right + ZHSysSpaceSmall;
    _actionBt.top = _nameLab.bottom + ZHSysSpaceSmall;
}

#pragma mark - Button Action
- (void)btnAction:(UIButton *)btn
{
    NSLog(@"观看视频");
}

- (void)_contextBtnAction:(UIButton *)btn
{
    ZHThanksWordVc *nextVc = [[ZHThanksWordVc alloc] initWithWord:btn.titleLabel.text];
    [self.viewController pushViewController:nextVc animated:YES];
}

@end
