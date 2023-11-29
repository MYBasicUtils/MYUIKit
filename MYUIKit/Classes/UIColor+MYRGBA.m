//
//  UIColor+TYRGBA.m
//  MYUIKit
//
//  Created by wmy on 2018/12/20.
//

#import "UIColor+MYRGBA.h"

inline UIColor * MY_RGBAColor(NSUInteger r, NSUInteger g, NSUInteger b, CGFloat a) {
    return [UIColor colorWithRed:MIN(MAX(0, r), 255)/255.0 green:MIN(MAX(0, g), 255)/255.0 blue:MIN(MAX(0, b), 255)/255.0 alpha:MIN(MAX(0, a), 1)];
}

inline UIColor * MY_RGBColor(NSUInteger r, NSUInteger g, NSUInteger b) {
    return MY_RGBAColor(r, g, b, 1);
}
