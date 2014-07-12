//
//  PJDearNeighbourCell.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-12.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "PJDearNeighbourCell.h"
#import "PJUserModel.h"

@interface PJDearNeighbourCell ()
{
    UIView *_bgView;
    UIImageView *_imgView;  //头像
    UILabel *_nameLab;      //头像
    UILabel *_numLab;       //推荐人数
    UILabel *_companyLab;   //公司及职务
}

@end

@implementation PJDearNeighbourCell

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
        
        _nameLab = [[UILabel alloc] initWithFrame:CGRectMake(_imgView.right + ZHSysSpaceLarge, ZHSysSpaceMiddle, 200, 50)];
        _nameLab.textColor = [UIColor blackColor];
        _nameLab.font = [UIFont systemFontOfSize:16];
        [self addSubview:_nameLab];
        
        _numLab = [[UILabel alloc] initWithFrame:CGRectMake(0, ZHSysSpaceMiddle, 200, 50)];
        [_numLab setLabelStyleTextColor:[UIColor darkGrayColor] fontSize:ZHSysFontSizeMiddle];
        [self addSubview:_numLab];
        
        _companyLab = [[UILabel alloc] initWithFrame:CGRectMake(_nameLab.left, 0, self.width - (_imgView.width + (ZHSysSpaceMiddle * 2)), 20)];
        [_companyLab setLabelStyleTextColor:[UIColor darkGrayColor] fontSize:ZHSysFontSizeMiddle];
        [self addSubview:_companyLab];
    }
    return self;
}
- (void)setItem:(PJUserModel *)user
{
    _imgView.image = [UIImage imageNamed:user.uPicPath];
    _nameLab.text = user.uName;
    _numLab.text = [NSString stringWithFormat:@"回答了%d个问题",[user.uFires count]];
    _companyLab.text = user.uCompany;
    [self setLayout];
}

- (void)setLayout
{
    [_nameLab sizeToFit];
    [_numLab sizeToFit];
    _numLab.left = _nameLab.right + ZHSysSpaceSmall;
    _companyLab.top = _nameLab.bottom + ZHSysSpaceSmall;
}

@end
