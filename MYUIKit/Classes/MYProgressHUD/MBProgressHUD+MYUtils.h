//
//  MBProgressHUD+MYUtils.h
//  MYNote
//
//  Created by 明妍 on 2018/12/2.
//  Copyright © 2018 明妍. All rights reserved.
//

#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUD (MYUtils)

//static UIWindow *keyWindow;


//+ (void)showSuccess:(NSString *)success;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

//+ (void)showError:(NSString *)error;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (void)showTip:(NSString *)tip toView:(UIView *)view completion:(void(^)(void))completion;

//+ (MBProgressHUD *)showMessage:(NSString *)message;
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;

+ (void)showLoadingToView:(UIView *)view;
+ (void)hideHUD;
+ (void)hideHUDForView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
