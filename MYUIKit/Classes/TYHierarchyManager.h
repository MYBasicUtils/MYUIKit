//
//  MYHierarchyManager.h
//  MYUIKit
//
//  Created by wmy on 2019/5/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

UIKIT_EXTERN UIWindow * MY_MainWindow(void);

/// [^zh]当前视图栈的顶控制器，包含present出的控制器[$zh] [^en]top controller of current view stack, including the presented controller[$en]
UIKIT_EXTERN UIViewController * MY_TopViewController(void);

NS_ASSUME_NONNULL_END
