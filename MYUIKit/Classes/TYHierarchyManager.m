//
//  MYHierarchyManager.m
//  MYUIKit
//
//  Created by wmy on 2019/5/30.
//

#import "TYHierarchyManager.h"


inline UIWindow * MY_MainWindow(void) {
    id appDelegate = [UIApplication sharedApplication].delegate;
    if (appDelegate && [appDelegate respondsToSelector:@selector(window)] && [appDelegate window]) {
        return [appDelegate window];
    }
    
    NSArray *windows = [UIApplication sharedApplication].windows;
    if ([windows count] == 1) {
        return [windows firstObject];
    }
    for (UIWindow *window in windows) {
        if (window.windowLevel == UIWindowLevelNormal) {
            return window;
        }
    }
    return nil;
}

inline UIViewController * MY_TopViewController(void) {
    UIViewController *topViewController = MY_MainWindow().rootViewController;
    UIViewController *temp = nil;
    
    while (YES) {
        temp = nil;
        if ([topViewController isKindOfClass:[UINavigationController class]]) {
            temp = ((UINavigationController *)topViewController).visibleViewController;
            
        } else if ([topViewController isKindOfClass:[UITabBarController class]]) {
            temp = ((UITabBarController *)topViewController).selectedViewController;
        }
        else if (topViewController.presentedViewController != nil) {
            temp = topViewController.presentedViewController;
        }
        
        if (temp != nil) {
            topViewController = temp;
        } else {
            break;
        }
    }
    
    return topViewController;
}
