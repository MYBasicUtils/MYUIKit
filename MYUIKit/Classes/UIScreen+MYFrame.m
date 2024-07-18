//
//  UIScreen+TYFrame.m
//  MYUIKit
//
//  Created by wmy on 2018/12/20.
//

#import "UIScreen+MYFrame.h"
#import "UIView+MYFrame.h"
#import "UIDevice+TYCategory.h"
#import "MYHierarchyManager.h"

static CGFloat KTYScreenAdaptionBase = 375.0;
static CGFloat _KTYScreenTabBarHeight = CGFLOAT_MIN;

@interface UIScreen (TYFrame)

+ (BOOL)my_isNotchScreen;

@end

@implementation UIScreen (TYFrame)

+ (BOOL)my_isNotchScreen {
    if (@available(iOS 11.0, *)) {
        static BOOL isNotchScreen;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            isNotchScreen = MY_MainWindow().safeAreaInsets.bottom > 0;
        });
        return isNotchScreen;
    }
    return NO;
}

@end


#pragma mark - Public
inline BOOL MY_IsNotchScreen(void) {
    return [[UIDevice currentDevice].systemVersion floatValue] >= 11.0 ? [UIScreen my_isNotchScreen] : NO;
}

inline CGRect MY_ScreenBounds(void) {
    return [UIScreen mainScreen].bounds;
}

inline CGSize MY_RealContentSize(void) {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat height = screenSize.height - 160;
    CGFloat width = ceil(height * 0.562);

    return CGSizeMake(width, height);
}

inline CGFloat MY_ScreenRealWidth(void) {
    return [UIScreen mainScreen].bounds.size.width;
}

inline CGFloat MY_ScreenRealHeight(void) {
    return [UIScreen mainScreen].bounds.size.height;
}

inline CGFloat MY_ScreenWidth(void) {
    if (MY_IsPad()) {
        return MY_RealContentSize().width;
    }
    return [UIScreen mainScreen].bounds.size.width;
}

inline CGFloat MY_ScreenHeight(void) {
    if (MY_IsPad()) {
        return MY_RealContentSize().height;
    }
    return [UIScreen mainScreen].bounds.size.height;
}

inline UIEdgeInsets MY_ScreenSafeInsets(void) {
    if (@available(iOS 11.0, *)) {
        return MY_MainWindow().safeAreaInsets;
    }
    return UIEdgeInsetsZero;
}

inline CGFloat MY_ScreenSafeTop(void) {
    return MY_ScreenSafeInsets().top;
}

inline CGFloat MY_ScreenSafeBottom(void) {
    return MY_ScreenSafeInsets().bottom;
}

inline CGFloat MY_StatusBarHeight(void) {
    return MY_IsNotchScreen() ? MY_ScreenSafeTop() : [UIApplication sharedApplication].statusBarFrame.size.height;
}

inline CGFloat MY_NaviBarHeight(void) {
    /// iPad 适配时，高度应该获取navigationBar的高度
    if (MY_TopViewController().navigationController) {
        if (MY_TopViewController().navigationController.modalPresentationStyle == UIModalPresentationCustom) {
            return MY_TopViewController().navigationController.navigationBar.frame.size.height;
        }
        return MY_StatusBarHeight() + MY_TopViewController().navigationController.navigationBar.frame.size.height;
    }
    return MY_StatusBarHeight() + 44;
}



inline CGFloat MY_TabBarHeight(void) {
    if (_KTYScreenTabBarHeight != CGFLOAT_MIN) {
        return _KTYScreenTabBarHeight;
    }
    return 49 + MY_ScreenSafeBottom();
}

inline void MY_TabBarCustomHeight(CGFloat height) {
    _KTYScreenTabBarHeight = height;
}

#pragma mark - ScreenAdaption
inline CGFloat MY_ScreenAdaptionLength(CGFloat length) {
    return MY_PixelAlignedLength(length / KTYScreenAdaptionBase * MY_ScreenWidth());
}
inline CGPoint MY_ScreenAdaptionPoint(CGPoint point) {
    return MY_PixelAlignedPoint(CGPointMake(point.x / KTYScreenAdaptionBase * MY_ScreenWidth(),
                                            point.y / KTYScreenAdaptionBase * MY_ScreenWidth()));
}
inline CGSize MY_ScreenAdaptionSize(CGSize size) {
    return MY_PixelAlignedSize(CGSizeMake(size.width / KTYScreenAdaptionBase * MY_ScreenWidth(),
                                          size.height / KTYScreenAdaptionBase * MY_ScreenWidth()));
}
inline CGRect MY_ScreenAdaptionRect(CGRect rect) {
    return MY_PixelAlignedRect(CGRectMake(rect.origin.x / KTYScreenAdaptionBase * MY_ScreenWidth(),
                                          rect.origin.y / KTYScreenAdaptionBase * MY_ScreenWidth(),
                                          rect.size.width / KTYScreenAdaptionBase * MY_ScreenWidth(),
                                          rect.size.height / KTYScreenAdaptionBase * MY_ScreenWidth()));
}
