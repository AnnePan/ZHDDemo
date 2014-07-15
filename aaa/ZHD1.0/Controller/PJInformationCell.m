//
//  PJInformationLatestCell.m
//  ZHD1.0
//
//  Created by hamigua on 14-7-15.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "PJInformationCell.h"

@interface PJInformationCell ()
{
    UIView *_bgView;
    UIImageView *_imgV;
    
}

@end

@implementation PJInformationCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
