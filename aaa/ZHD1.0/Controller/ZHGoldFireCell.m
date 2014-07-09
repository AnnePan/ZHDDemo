//
//  ZHGoldFireCell.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-8.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHGoldFireCell.h"
#import "PJUserModel.h"

@interface ZHGoldFireCell ()
{
    UIView *_bgView;
    UIImageView *_imgView; //头像
    UILabel *_nameLab;  //头像
    UILabel *_numLab;   //推荐人数
    UIButton *_actionBt;    //观看视频Btn
    UIImageView *_makeIV;   //标志
}

@end

@implementation ZHGoldFireCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.height = 70;
        self.backgroundColor = [UIColor lightGrayColor];
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(ZHSysSpaceLarge, ZHSysSpaceMiddle, self.width - (ZHSysSpaceLarge * 2), self.height - ZHSysSpaceMiddle)];
        _bgView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_bgView];
        
        CGFloat side = _bgView.height - (ZHSysSpaceMiddle * 2);
        _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(ZHSysSpaceMiddle, ZHSysSpaceMiddle, side, side)];
        _imgView.layer.masksToBounds = YES;
        _imgView.layer.cornerRadius = side/2;
        [_bgView addSubview:_imgView];
        
        _nameLab = [[UILabel alloc] initWithFrame:CGRectMake(_imgView.right + ZHSysSpaceLarge, ZHSysSpaceMiddle, 200, 50)];
        [_nameLab setLabelStyleTextColor:[UIColor blackColor] fontSize:ZHSysFontSizeLarge];
        [_bgView addSubview:_nameLab];
        
        _numLab = [[UILabel alloc] initWithFrame:CGRectMake(0, ZHSysSpaceMiddle, 200, 50)];
        [_numLab setLabelStyleTextColor:[UIColor blackColor] fontSize:ZHSysFontSizeMiddle];
        [_bgView addSubview:_numLab];
        
        _actionBt = [[UIButton alloc] initWithFrame:CGRectMake(_nameLab.left, 0, 80, 20)];
        _actionBt.backgroundColor = [UIColor blueColor];
        _actionBt.titleLabel.font = [UIFont systemFontOfSize:ZHSysFontSizeMiddle];
        [_actionBt setTitle:@"观看视频" forState:UIControlStateNormal];
        [_actionBt addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [_bgView addSubview:_actionBt];
    }
    return self;
}

- (void)setItem:(PJUserModel *)user
{
    _imgView.image = [UIImage imageNamed:user.uPicPath];
    _nameLab.text = user.uName;
    _numLab.text = [NSString stringWithFormat:@"－推荐了%d个岛亲",[user.uFires count]];
}

- (void)layoutSubviews
{
    [_nameLab sizeToFit];
    [_numLab sizeToFit];
    _numLab.left = _nameLab.right + ZHSysSpaceSmall;
//    _actionBt.bottom = _bgView.bottom + ZHSysSpaceSmall;
    _actionBt.bottom = _bgView.height - ZHSysSpaceMiddle;
}

#pragma mark - Button Action
- (void)btnAction:(UIButton *)btn
{
    NSLog(@"观看视频");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
