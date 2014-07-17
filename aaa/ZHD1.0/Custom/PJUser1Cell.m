//
//  PJUser1Cell.m
//  BusinessCircle
//
//  Created by Anne Pan on 14-6-18.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "PJUser1Cell.h"
#import "UILabel+Additions.h"

#define kFONTSIZE_BETTER 16
#define kFONTSIZE_SMALL 14

#define kHEIGHT 70


@interface PJUser1Cell ()
{
    UIImageView     *_uHeadIV;          //用户头像
    UIImageView     *_uInceIV;          //大V标志
    UIView          *_uInfoV;           //用户资料
    UILabel         *_uNameLab;         //用户姓名
    UILabel         *_uPositionLab;     //用户职务
}

@end

@implementation PJUser1Cell

#pragma mark - 用户显示方式1
//75,10
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        self.frame = CGRectMake(0, 0, self.width, kHEIGHT);
        
        CGFloat margin = 0;
        if ([reuseIdentifier isEqualToString:@"ZHContactsVc"]) {
            margin = 10;
            _uInceIV.hidden = YES;
        } else {
            margin = 15;
        }
        
        _uHeadIV = [[UIImageView alloc] initWithFrame:CGRectMake(margin, margin, self.height - (margin * 2), self.height - (margin * 2))];
        [self addSubview:_uHeadIV];
        
        _uInfoV = [[UIView alloc] initWithFrame:CGRectMake(_uHeadIV.right + margin, _uHeadIV.top + margin/2, self.width - (_uHeadIV.right + margin), _uHeadIV.height - margin)];
        [self addSubview:_uInfoV];
        
        _uNameLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _uInfoV.width, _uInfoV.height)];
        [_uNameLab setLabelStyleTextColor:[UIColor blackColor] fontSize:kFONTSIZE_BETTER];
        [_uInfoV addSubview:_uNameLab];
        
        _uPositionLab = [[UILabel alloc] initWithFrame:_uNameLab.frame];
        [_uPositionLab setLabelStyleTextColor:[UIColor grayColor] fontSize:kFONTSIZE_SMALL];
        [_uInfoV addSubview:_uPositionLab];
    }
    return self;
}

- (void)setItem:(PJUserModel *)item
{
    _uHeadIV.image = [UIImage imageNamed:item.uPicPath];
    _uNameLab.text = item.uName;
    _uPositionLab.text = item.uCompany;
    
    [_uNameLab sizeToFit];
    [_uPositionLab sizeToFit];
    _uPositionLab.bottom = _uInfoV.height ;
}

#pragma mark - 选择器



@end
