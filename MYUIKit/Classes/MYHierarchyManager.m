//
//  MYHierarchyManager.m
//  MYUIKit
//
//  Created by wmy on 2019/5/30.
//

#import "MYHierarchyManager.h"


inline UIWindow * MY_MainWindow(void) {
    id appDelegate = [UIApplication sharedApplication].delegate;
    if (appDelegate && [appDelegate respondsToSelector:@selector(window)] && [appDelegate window]) {
        return [appDelegate window];
    }
    
    NSSet *connectedScenes = [UIApplication sharedApplication].connectedScenes;
    for (UIWindowScene *windowScene in connectedScenes) {
        if (windowScene.activationState == UISceneActivationStateForegroundActive) {
            return windowScene.windows.firstObject;
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
