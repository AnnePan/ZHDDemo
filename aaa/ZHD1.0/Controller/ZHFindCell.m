//
//  ZHFindCell.m
//  ZHD1.0
//
//  Created by hamigua on 14-7-17.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHFindCell.h"

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
        CGSize imgSize = CGSizeMake(50, 50);
        _uHeadIV = [[UIImageView alloc] initWithFrame:CGRectMake(ZHSysSpaceMiddle, ZHSysSpaceMiddle, imgSize.width, imgSize.height)];
        _uHeadIV.layer.masksToBounds = YES;
        _uHeadIV.layer.cornerRadius = _uHeadIV.width / 2;
        [self addSubview:_uHeadIV];
        
        _uNameLab = [[UILabel alloc] initWithFrame:CGRectMake(imgSize.width + (ZHSysSpaceLarge * 2), ZHSysSpaceLarge, 200, self.height)];
        [_uNameLab setLabelStyleTextColor:[UIColor blackColor] fontSize:ZHSysFontSizeDefault];
        [self addSubview:_uNameLab];
        
        _uPositionLab = [[UILabel alloc] initWithFrame:_uNameLab.frame];
        [_uPositionLab setLabelStyleTextColor:[UIColor grayColor] fontSize:ZHSysFontSizeLarge];
        [self addSubview:_uPositionLab];
    }
    return self;
}

- (void)setItem:(NSDictionary *)item
{
    _uHeadIV.image = [UIImage imageNamed:item[@"image"]];
    _uNameLab.text = item[@"key"];
    
    NSMutableString *mutableStr = [[NSMutableString alloc] init];
    if ([item[@"value"] isKindOfClass:NSArray.class]) {
        NSArray *arr = item[@"value"];
        if (arr.count > 3){
            for (int i = 0; i < 3; i++) {
                [mutableStr appendString:[NSString stringWithFormat:@"%@",arr[i]]];
            }
        } else if (arr.count < 3 && arr.count > 0) {
            for (NSString *str in arr) {
                [mutableStr appendString:[NSString stringWithFormat:@"%@",str]];
            }
        }
        
    }
    _uPositionLab.text = mutableStr;
    [self setLayout];
}

- (void)setLayout
{
    [_uNameLab sizeToFit];
    [_uPositionLab sizeToFit];
    _uPositionLab.width = 200;
    _uPositionLab.top = _uNameLab.bottom + ZHSysSpaceSmall;
}

@end
