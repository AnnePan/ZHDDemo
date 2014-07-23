//
//  PJAllFireCell.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-7.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "PJAllFireCell.h"
#import "PJUserModel.h"

@interface PJAllFireCell ()
{
    UIView *_bgView;
    UIImageView *_imgView; //头像
    UILabel *_nameLab;  //名字
    UILabel *_numLab;   //推荐人数
    UIImageView *_makeIV;   //标志
}

@end

@implementation PJAllFireCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.height = 70;
        self.backgroundView.backgroundColor = self.backgroundColor = [UIColor sysColor];
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
        
        _numLab = [[UILabel alloc] initWithFrame:CGRectMake(_imgView.right + ZHSysSpaceLarge, 0, 200, 50)];
        [_numLab setLabelStyleTextColor:[UIColor blackColor] fontSize:ZHSysFontSizeMiddle];
        [_bgView addSubview:_numLab];
    }
    return self;
}

- (void)setItem:(PJUserModel *)user
{
    _imgView.image = [UIImage imageNamed:user.uPicPath];
    _nameLab.text = user.uName;
    _numLab.text = [NSString stringWithFormat:@"推荐了%d个岛亲",[user.uFires count]];
}

- (void)layoutSubviews
{
    [_nameLab sizeToFit];
    [_numLab sizeToFit];
    _numLab.bottom = _bgView.height - ZHSysSpaceMiddle;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    NSLog(@"selected");
}

@end
