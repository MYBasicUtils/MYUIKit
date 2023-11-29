//
//  UIDevice+TYSystemInfo.h
//  MYUIKit
//
//  Created by wmy on 2018/12/20.
//

#import <UIKit/UIKit.h>


UIKIT_EXTERN NSString *const kTYSystemName_iOS;

/**
 @return [[[UIDevice currentDevice] systemVersion] floatValue]
 */
UIKIT_EXTERN CGFloat MY_SystemVersion(void);
/**
 @return [[UIDevice currentDevice] systemName]
 */
UIKIT_EXTERN NSString * MY_SystemName(void);

/**
 @return [MY_SystemName isEqualToString:@"iOS"] && MY_SystemVersion >= version
 */
UIKIT_EXTERN BOOL MY_IsIOS(CGFloat version);


/**
 是否支持ipad
 */
UIKIT_EXTERN BOOL MY_IsPad(void);

