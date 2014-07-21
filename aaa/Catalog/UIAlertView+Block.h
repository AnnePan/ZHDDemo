//
//  UIAlertView+Block.h
//  PAJKCardApp
//
//  Created by wangweishun on 6/20/14.
//  Copyright (c) 2014 Ping An Health Insurance Company of China, Ltd. All rights reserved.
//

typedef void (^DismissBlock)(int buttonIndex);
typedef void (^CancelBlock)();

@interface UIAlertView (Block) <UIAlertViewDelegate>

+ (UIAlertView *)alertViewWithTitle:(NSString *)title
                            message:(NSString *)message;

+ (UIAlertView *)alertViewWithTitle:(NSString *)title
                            message:(NSString *)message
                  cancelButtonTitle:(NSString *)cancelButtonTitle;

+ (UIAlertView *)alertViewWithTitle:(NSString *)title
                            message:(NSString *)message
                  cancelButtonTitle:(NSString *)cancelButtonTitle
                  otherButtonTitles:(NSArray *)otherButtons
                          onDismiss:(DismissBlock)dismissed
                           onCancel:(CancelBlock)cancelled;

@property (nonatomic, copy) DismissBlock dismissBlock; //other buttons event
@property (nonatomic, copy) CancelBlock cancelBlock;   //cancel event

@end
