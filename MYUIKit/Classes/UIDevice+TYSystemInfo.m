//
//  UIDevice+TYSystemInfo.m
//  MYUIKit
//
//  Created by wmy on 2018/12/20.
//

#import "UIDevice+TYSystemInfo.h"

NSString * const kTYSystemName_iOS = @"iOS";

inline CGFloat MY_SystemVersion(void) {
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

inline NSString * MY_SystemName(void) {
    return [[UIDevice currentDevice] systemName];
}

inline BOOL MY_IsIOS(CGFloat v) {
    return [MY_SystemName() isEqualToString:kTYSystemName_iOS] && MY_SystemVersion() >= v;
}


inline BOOL MY_IsPad(void) {
    BOOL isPadSupport = [[[NSBundle mainBundle] objectForInfoDictionaryKey:@"MY_PadSupport"] boolValue];
    return isPadSupport && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}
