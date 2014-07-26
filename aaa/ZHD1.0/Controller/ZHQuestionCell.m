//
//  ZHQuestionCell.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-12.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHQuestionCell.h"
#import "PJQuestionModel.h"

@interface ZHQuestionCell ()
{
    UIView *_bgView;
    UIImageView *_imgView;  //头像
    UILabel *_nameLab;      //名字
    UILabel *_titleLab;     //提问title
    UILabel *_numLab;       //转评数量和加金数量
    UILabel *_timeLab;      //提问时间
}

@end

@implementation ZHQuestionCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.height = 80;
        self.backgroundView.backgroundColor = self.backgroundColor = [UIColor sysColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(ZHSysSpaceLarge, ZHSysSpaceMiddle, self.width - (ZHSysSpaceLarge * 2), self.height)];
        _bgView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_bgView];
        
        CGFloat side = _bgView.height - (ZHSysSpaceMiddle * 2);
        _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(ZHSysSpaceMiddle, ZHSysSpaceMiddle, side, side)];
        _imgView.layer.masksToBounds = YES;
        _imgView.layer.cornerRadius = side/2;
        [_bgView addSubview:_imgView];
        
        _nameLab = [[UILabel alloc] initWithFrame:CGRectMake(_imgView.right + ZHSysSpaceLarge, ZHSysSpaceMiddle, 200, 50)];
        [_nameLab setLabelStyleTextColor:[UIColor blueColor] fontSize:ZHSysFontSizeLarge];
        [_bgView addSubview:_nameLab];
        
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(_imgView.right + ZHSysSpaceLarge, 0, 150, 50)];
        [_titleLab setLabelStyleTextColor:[UIColor blackColor] fontSize:ZHSysFontSizeLarge];
        [_bgView addSubview:_titleLab];
        
        _numLab = [[UILabel alloc] initWithFrame:CGRectMake(_imgView.right + ZHSysSpaceLarge, 0, 200, 50)];
        [_numLab setLabelStyleTextColor:[UIColor blackColor] fontSize:ZHSysFontSizeMiddle];
        [_bgView addSubview:_numLab];
        
        _timeLab = [[UILabel alloc] initWithFrame:_numLab.bounds];
        [_timeLab setLabelStyleTextColor:[UIColor grayColor] fontSize:ZHSysFontSizeSmall];
        [_bgView addSubview:_timeLab];
    }
    return self;

}

- (void)setItem:(PJQuestionModel *)question
{
    _imgView.image = [UIImage imageNamed:question.uPicPath];
    _nameLab.text = question.uName;
    _titleLab.text = question.qTitle;
    _numLab.text = [NSString stringWithFormat:@"转评 %d  加金 %d",[question.qTransfers count],[question.qAddtions count]];
    _timeLab.text = question.qTimeStr;
    
    [self setLayout];
}

- (void)setLayout
{
    [_nameLab sizeToFit];
    [_titleLab sizeToFit];
    [_numLab sizeToFit];
    [_timeLab sizeToFit];
    _titleLab.top = _nameLab.bottom;
    _numLab.bottom = _bgView.height - ZHSysSpaceMiddle;
    _timeLab.bottom = _numLab.bottom;
    _timeLab.right = _bgView.right - 25;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    NSLog(@"selected");
}

@end
