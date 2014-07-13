//
//  PJOldNewsCell.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-12.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "PJOldNewsCell.h"
#import "PJNewsModle.h"

@interface PJOldNewsCell ()
{
    UILabel *_nTitleLab;  //手机报标题
    UILabel *_nTimeLab;   //手机报时间
}

@end

@implementation PJOldNewsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _nTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(ZHSysSpaceNews, ZHSysSpaceLarge, self.width - (ZHSysSpaceNews * 2), self.height - ZHSysSpaceLarge)];
        [_nTitleLab setLabelStyleTextColor:[UIColor blackColor] fontSize:16];
        [self addSubview:_nTitleLab];
        
        _nTimeLab = [[UILabel alloc] initWithFrame:_nTitleLab.frame];
        [_nTimeLab setLabelStyleTextColor:[UIColor darkGrayColor] fontSize:ZHSysFontSizeMiddle];
        [self addSubview:_nTimeLab];
    }
    return self;
}
- (void)setItem:(PJNewsModle *)news
{
    _nTitleLab.text = news.nTitle;
    _nTimeLab.text = news.nTime;
    [self setLayout];
}

- (void)setLayout
{
    [_nTitleLab sizeToFit];
    [_nTimeLab sizeToFit];
    _nTimeLab.top = _nTitleLab.bottom + ZHSysSpaceSmall;
}

@end
