//
//  MYDialog.m
//  CocoaLumberjack
//
//  Created by APPLE on 2024/7/19.
//

#import "MYDialog.h"
#import <MYUIKit/MYUIKit.h>
#import <MYUtils/MYUtils.h>
#import "MYDialogView.h"
#import <Masonry/Masonry.h>

@interface MYDialog ()

@property (nonatomic, strong) MYDialogView *dialogView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) MASConstraint *bottomConstraint;

@end

@implementation MYDialog

+ (instancetype)showDialogWithView:(UIView *)view {
    MYDialog *dialog = [[MYDialog alloc] init];
    dialog.contentView = view;
    [dialog show];
    return dialog;
}

- (void)show {
    self.dialogView = [self configDialogView];
    self.dialogView.dialog = self;
    if (self.contentView) {
        [self.dialogView addContentView:self.contentView];
    }
    [MY_MainWindow() addSubview:self.dialogView];

    // 设置初始约束，将 dialogView 放在屏幕外
    [self.dialogView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(MY_MainWindow());
        self.bottomConstraint = make.top.equalTo(MY_MainWindow().mas_bottom); // 初始位置在屏幕外
    }];

    // 强制布局以应用初始约束
    [self.dialogView layoutIfNeeded];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 更新约束，将 dialogView 移动到屏幕内
        [self.bottomConstraint uninstall];
        CGFloat dialogViewHeight = self.dialogView.frame.size.height;
        [self.dialogView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(MY_MainWindow()).offset(MY_ScreenHeight() - dialogViewHeight); // 移动到屏幕内
        }];

        // 执行动画
        [UIView animateWithDuration:0.35 animations:^{
            [self.dialogView layoutIfNeeded];
        }];
    });
    
}

- (void)dismiss {
    CGRect frame = self.dialogView.frame;
    frame.origin.y = MY_ScreenHeight();
    [UIView animateWithDuration:0.35 animations:^{
        self.dialogView.frame = frame;
    } completion:^(BOOL finished) {
        [self.dialogView removeFromSuperview];
        self.dialogView = nil;
    }];
}

- (MYDialogView *)configDialogView {
    if (!_dialogView) {
        _dialogView = [[MYDialogView alloc] init];
        my_weakify(self);
        _dialogView.clickBlock = ^{
            my_strongify(self);
            [self dismiss];
        };
    }
    return _dialogView;
}

@end
