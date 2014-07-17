//
//  ZHFindCell.m
//  ZHD1.0
//
//  Created by hamigua on 14-7-17.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHFindCell.h"
#import "PJUserModel.h"

@interface ZHFindCell ()
{
    UIImageView     *_uHeadIV;          //用户头像
    UILabel         *_uNameLab;         //用户姓名
    UILabel         *_uPositionLab;     //用户职务
}

@end

@implementation ZHFindCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGSize imgSize = CGSizeMake(40, 40);
        _uHeadIV = [[UIImageView alloc] initWithFrame:CGRectMake(ZHSysSpaceLarge, ZHSysSpaceLarge, imgSize.width, imgSize.height)];
        [self addSubview:_uHeadIV];
        
        _uNameLab = [[UILabel alloc] initWithFrame:CGRectMake(imgSize.width + (ZHSysSpaceLarge * 2), ZHSysSpaceLarge, 200, self.height)];
        _uNameLab.backgroundColor = [UIColor redColor];
        [self addSubview:_uNameLab];
        
        _uPositionLab = [[UILabel alloc] initWithFrame:_uNameLab.frame];
        _uPositionLab.backgroundColor = [UIColor yellowColor];
        [self addSubview:_uPositionLab];
    }
    return self;
}

- (void)setItem:(PJUserModel *)item
{
    _uHeadIV.image = [UIImage imageNamed:item.uPicPath];
    _uNameLab.text = @"张三";
    _uPositionLab.text = @"结果看风景广泛的功夫都快关键时刻的结果";
    [self setLayout];
}

- (void)setLayout
{
    [_uNameLab sizeToFit];
    [_uPositionLab sizeToFit];
    _uPositionLab.top = _uNameLab.bottom + ZHSysSpaceSmall;
}

@end
