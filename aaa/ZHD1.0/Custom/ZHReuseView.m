//
//  ZHReuseView.m
//  ZHD
//
//  Created by Anne Pan on 14-6-21.
//  Copyright (c) 2014年 wba. All rights reserved.
//

#import "ZHReuseView.h"
#import "PJUserModel.h"
#import "UILabel+Additions.h"

#define kFONTSIZE_LARGR 18
#define kFONTSIZE_BETTER 16
#define kFONTSIZE_SMALL 13

@implementation ZHReuseView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (id)initUser2WithFrame:(CGRect)frame user:(PJUserModel *)user
{
    if (self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor whiteColor];
        CGFloat margin = 0;
        if (self.height < 80) {
            margin = 10;
        } else {
            margin = 15;
        }
        
        UIImageView *uHeadIV = [[UIImageView alloc] initWithFrame:CGRectMake(margin, margin, 90, 90)];
//        UIImageView *uHeadIV = [[UIImageView alloc] initWithFrame:CGRectMake(margin, margin, self.height - (margin * 2), self.height - (margin * 2))];
        uHeadIV.image = [UIImage imageNamed:user.uPicPath];
        [self addSubview:uHeadIV];
        
        UILabel *uNameLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.width - (uHeadIV.right + (margin * 2)), self.height)];
        [uNameLab setLabelStyleTextColor:[UIColor blackColor] fontSize:kFONTSIZE_LARGR];
        uNameLab.text = user.uName;
        
        UILabel *uPositionLab = [[UILabel alloc] initWithFrame:uNameLab.frame];
        [uPositionLab setLabelStyleTextColor:[UIColor blackColor] fontSize:kFONTSIZE_SMALL];
        uPositionLab.text = user.uCompany;
        uPositionLab.numberOfLines = 2;
        uPositionLab.lineBreakMode = UILineBreakModeWordWrap;
        
        [uNameLab sizeToFit];
        [uPositionLab sizeToFitNumberOfLines];
        
        UIView *uInfoV = [[UIView alloc] initWithFrame:CGRectMake(uHeadIV.right + margin, uHeadIV.top + 5, self.width - (uHeadIV.right + margin), self.height - (margin * 2))];
        [self addSubview:uInfoV];
        [uInfoV addSubview:uNameLab];
        [uInfoV addSubview:uPositionLab];
        uPositionLab.top = uNameLab.bottom + 5;
        
        if (user.uIsVIP) {
            UIImageView *imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"v_green"]];
            [uInfoV addSubview:imgV];
            imgV.left = uNameLab.right + 5;
            imgV.top = uNameLab.top;
            imgV.hidden = YES;
        }
        
        if (user.uPeapleColor.count > 0) {
            UIImageView *imgV1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:user.uPeapleColor[0]]];
            UIView *uPeapleColorV = [[UIView alloc] initWithFrame:imgV1.frame];
            uPeapleColorV.width = uInfoV.width;
            uPeapleColorV.top = uNameLab.bottom + 10;
            uPositionLab.top = uPeapleColorV.bottom + 10;
            [uPeapleColorV addSubview:imgV1];
            [uInfoV addSubview:uPeapleColorV];
            for (int i = 1; i < user.uPeapleColor.count; i++) {
                UIImageView *imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:user.uPeapleColor[i]]];
                imgV.left = i * (imgV.width + 5);
                [uPeapleColorV addSubview:imgV];
            }
        }
    }
    return self;
}

- (id)initContactVWithFrame:(CGRect)frame user:(PJUserModel *)user
{
    if (self = [super initWithFrame:frame]) {
        CGFloat margin = 10;
        UIView *bgV =[[UIView alloc]initWithFrame:CGRectMake(margin + 5, margin/2, self.width - ((margin+5) * 2), self.height - (margin * 1.5))];
        bgV.layer.borderWidth = 1;
        bgV.layer.borderColor = [[UIColor grayColor] CGColor];
        [self addSubview:bgV];
        
        //电话号码／微信号
        UILabel *numLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        if (user.uTelphone) {
            numLab.text = [NSString stringWithFormat:@"%lld",user.uTelphone];
            numLab.textColor = [UIColor blueColor];
        } else if (user.uWeChatNum) {
            numLab.text = [NSString stringWithFormat:@"微信号：%@",user.uWeChatNum];
        }
        UIView *numV = [self contackWithImage:@"profile_icon_tel" Label:numLab frame:CGRectMake(margin, margin, self.width - margin, 16)];
        [bgV addSubview:numV];
        
        //电子邮箱
        UILabel *emailLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        emailLab.text = user.uEmail;
        emailLab.textColor = [UIColor blueColor];
        UIView *emailV = [self contackWithImage:@"profile_icon_email" Label:emailLab frame:numV.frame];
        emailV.top = numV.bottom + margin;
        [bgV addSubview:emailV];
        
        //电子邮箱
        UILabel *recoLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        recoLab.text = [NSString stringWithFormat:@"通过岛丁 %@ 联系我：%@ %@",user.uRecommender,@"私信",@"客服"];
        UIView *recoV = [self contackWithImage:@"profile_icon_server" Label:recoLab frame:numV.frame];
        recoV.top = emailV.bottom + margin;
        [bgV addSubview:recoV];
    }
    return self;
}

- (UIView *)contackWithImage:(NSString *)imageName Label:(UILabel *)label frame:(CGRect)frame
{
    UIView *oneContact = [[UIView alloc] initWithFrame:frame];
    UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    [oneContact addSubview:iv];
    label.font = [UIFont systemFontOfSize:14];
    [label sizeToFit];
    [oneContact addSubview:label];
    label.left = iv.right + 10;
    label.centerY = iv.centerY;
    return oneContact;
}

- (UIView *)infoViewWithinfoArray:(NSArray *)infoArr width:(CGFloat)width
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, width)];
    for (int i = 0; i < infoArr.count; i++) {
        UIView *subV = [[UIView alloc] initWithFrame:view.frame];
        UILabel *nameLab = [[UILabel alloc] initWithFrame:subV.frame];
//        nameLab.text =
        NSArray *arr = [[NSArray alloc] init];
        arr = @[@{@"key":@"擅长或经验",@"value":@[@"企业文化",@"品牌管理",@"团队建设",@"市场营销",@"财务管理",@"团队建设"]},@{@"key":@"所在行业",@"value":@[@{@"电子电器":@"物联网射频方案专家"},@{@"电子/电器/半导体/仪器仪表":@"XXX是一家提供物联网综合解决方案的高新企业。致力于向客户提供芯片。"}]},@{}];
    }
    return view;
}

@end
