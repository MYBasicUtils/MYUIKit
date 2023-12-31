//
//  MBProgressHUD+MYUtils.m
//  MYNote
//
//  Created by 明妍 on 2018/12/2.
//  Copyright © 2018 明妍. All rights reserved.
//

#import "MBProgressHUD+MYUtils.h"

@implementation MBProgressHUD (MYUtils)

/**
 *  =======显示信息
 *  @param text 信息内容
 *  @param icon 图标
 *  @param view 显示的视图
 */
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view completion:(void(^)(void))completion {
    if (view == nil)
        view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = text;
    
    hud.label.textColor = [UIColor whiteColor];
    //hud.bezelView.style = MBProgressHUDBackgroundStyleSolidCo;
    hud.label.font = [UIFont systemFontOfSize:17.0];
    hud.userInteractionEnabled= NO;
    //TODO: wmy
//    hud.customView = [[UIImageView alloc] initWithImage:icon];  // 设置图片
    hud.bezelView.backgroundColor = [UIColor grayColor];    //背景颜色
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MYUIKit.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    hud.completionBlock = completion;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hideAnimated:YES afterDelay:1.5];
}

+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view {
    [self show:text icon:icon view:view completion:nil];
}

/**
 *  =======显示 提示信息
 *  @param success 信息内容
 */
+ (void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:nil];
}

/**
 *  =======显示
 *  @param success 信息内容
 */
+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success icon:@"success.png" view:view];
}

/**
 *  =======显示错误信息
 */
+ (void)showError:(NSString *)error
{
    [self showError:error toView:UIApplication.sharedApplication.keyWindow];
}

+ (void)showError:(NSString *)error toView:(UIView *)view{
    //TODO: wmy 错误图片
//    [self show:error icon:@"error.png" view:view];
    [self show:error icon:nil view:view];
}

+ (void)showTip:(NSString *)tip toView:(UIView *)view completion:(void(^)(void))completion {
    [self show:tip icon:nil view:view completion:completion];
}

/**
 *
 *
 *  显示提示 + 菊花
 *  @param message 信息内容
 *  @return 直接返回一个MBProgressHUD， 需要手动关闭(  ?
 */
+ (MBProgressHUD *)showMessage:(NSString *)message
{
    return [self showMessage:message toView:UIApplication.sharedApplication.keyWindow];
}

/**
 *  显示一些信息
 *  @param message 信息内容
 *  @param view    需要显示信息的视图
 *  @return 直接返回一个MBProgressHUD，需要手动关闭
 */
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
//    hud.dimBackground = YES;
    
    return hud;
}


+ (void)showLoadingToView:(UIView *)view {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    // Set the label text.
    hud.label.text = NSLocalizedString(@"Loading...", @"HUD loading title");
    // You can also adjust other label properties if needed.
    // hud.label.font = [UIFont italicSystemFontOfSize:16.f];
}
/**
 *  手动关闭MBProgressHUD
 */
+ (void)hideHUD
{
    [self hideHUDForView:nil];
}
/**
 *  @param view    显示MBProgressHUD的视图
 */
+ (void)hideHUDForView:(UIView *)view
{
    if (view == nil)
        view = [[UIApplication sharedApplication].windows lastObject];
    
    [self hideHUDForView:view animated:YES];
}

@end
