//
//  ZHThanksWordVc.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-24.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHThanksWordVc.h"

@interface ZHThanksWordVc ()
{
    NSString *_text;
    UILabel *_textLab;
}

@end

@implementation ZHThanksWordVc

- (id)initWithWord:(NSString *)word
{
    if (self = [super init]) {
        _text = word;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"感言详情";
    
    _textLab = [[UILabel alloc] initWithFrame:CGRectMake(ZHSysSpaceMiddle, ZHSysSpaceMiddle, self.view.width - (ZHSysSpaceMiddle * 2), 0)];
    [_textLab setLabelStyleTextColor:[UIColor blackColor] fontSize:ZHSysFontSizeDefault];
    _textLab.textAlignment = NSTextAlignmentLeft;
    _textLab.lineBreakMode = NSLineBreakByWordWrapping;
    _textLab.numberOfLines = 0;
    _textLab.text = _text;
    [_textLab sizeToFitNumberOfLines];
    _textLab.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_textLab];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
