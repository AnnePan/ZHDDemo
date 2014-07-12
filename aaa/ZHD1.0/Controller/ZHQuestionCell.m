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
/*
 - (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
 {
 self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
 if (self) {
 self.backgroundColor = [UIColor lightGrayColor];
 _bgView = [[UIView alloc] initWithFrame:CGRectMake(ZHSysSpaceLarge, ZHSysSpaceMiddle, self.width - (ZHSysSpaceLarge * 2), self.height - ZHSysSpaceMiddle)];
 _bgView.backgroundColor = [UIColor whiteColor];
 [self addSubview:_bgView];
 
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
 }
 return self;
 }
 */
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(ZHSysSpaceLarge, ZHSysSpaceMiddle, self.width - (ZHSysSpaceLarge * 2), self.height)];
        _bgView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_bgView];
        
//        CGFloat side = _bgView.height - (ZHSysSpaceMiddle * 2);
//        _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(ZHSysSpaceMiddle, ZHSysSpaceMiddle, side, side)];
//        _imgView.layer.masksToBounds = YES;
//        _imgView.layer.cornerRadius = side/2;
//        [_bgView addSubview:_imgView];
//        
//        _nameLab = [[UILabel alloc] initWithFrame:CGRectMake(_imgView.right + ZHSysSpaceLarge, ZHSysSpaceMiddle, 200, 50)];
//        [_nameLab setLabelStyleTextColor:[UIColor blackColor] fontSize:ZHSysFontSizeLarge];
//        [_bgView addSubview:_nameLab];
//        
//        _numLab = [[UILabel alloc] initWithFrame:CGRectMake(_imgView.right + ZHSysSpaceLarge, 0, 200, 50)];
//        [_numLab setLabelStyleTextColor:[UIColor blackColor] fontSize:ZHSysFontSizeMiddle];
//        [_bgView addSubview:_numLab];
//        
//        _timeLab = [[UILabel alloc] initWithFrame:_numLab.bounds];
//        [_timeLab setLabelStyleTextColor:[UIColor grayColor] fontSize:ZHSysFontSizeSmall];
//        [_bgView addSubview:_timeLab];
    }
    return self;

}

- (void)setItem:(PJQuestionModel *)question
{
    _imgView.image = [UIImage imageNamed:question.uPicPath];
    _nameLab.text = question.uName;
    _numLab.text = [NSString stringWithFormat:@"转评 %d  加金 %d",[question.qTransfers count],[question.qAddtions count]];
    _timeLab.text = question.qTimeStr;
    
    [self setLayout];
}

- (void)setLayout
{
    [_nameLab sizeToFit];
    [_numLab sizeToFit];
    [_timeLab sizeToFit];
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
