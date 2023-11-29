//
//  UIColor+TYHex.h
//  MYUIKit
//
//  Created by wmy on 2018/12/17.
//

#import <UIKit/UIKit.h>

/**
 @param hex             [^zh]颜色的16进制RGB值，形如 0x00FF00、0xFF00FF00[$zh] [^en]RGB like 0x00FF00, or ARGB like 0xFF00FF00[$en]
 */
UIKIT_EXTERN UIColor * MY_HexColor(uint32_t hex);

/**
 @param hex             [^zh]颜色的16进制RGB值，形如 0x00FF00[$zh] [^en]RGB like 0x00FF00[$en]
 @param alpha        [^zh]颜色alpha值，alpha ∈ [0, 1][$zh] [^en]alpha value, alpha ∈ [0, 1][$en]
 */
UIKIT_EXTERN UIColor * MY_HexAlphaColor(uint32_t hex, CGFloat alpha);


@interface UIColor (MYHex)

/**
 @param hex             [^zh]颜色的16进制RGB值，形如 0x00FF00、0xFF00FF00[$zh] [^en]RGB like 0x00FF00, or ARGB like 0xFF00FF00[$en]
 */
+ (UIColor *)my_colorWithHex:(uint32_t)hex;
/**
 @param hex             [^zh]颜色的16进制RGB值，形如 0x00FF00[$zh] [^en]RGB like 0x00FF00[$en]
 @param alpha         [^zh]颜色alpha值，alpha ∈ [0, 1][$zh] [^en]alpha value, alpha ∈ [0, 1][$en]
 */
+ (UIColor *)my_colorWithHex:(uint32_t)hex alpha:(CGFloat)alpha;

/**
 @param hexStr          [^zh]颜色的16进制RGB值，形如 0x00FF00、0xFF00FF00[$zh] [^en]RGB like 0x00FF00, or ARGB like 0xFF00FF00[$en]
 @return [^zh]若hexStr为非法值，则返回nil[$zh] [^en]return nil if hexStr is illegal[$en]
 */
+ (UIColor *)my_colorWithHexString:(NSString *)hexStr;
/**
 @param hexStr          [^zh]颜色的16进制RGB值，形如 0x00FF00、0xFF00FF00[$zh] [^en]RGB like 0x00FF00, or ARGB like 0xFF00FF00[$en]
 @param alpha            [^zh]颜色alpha值，alpha ∈ [0, 1][$zh] [^en]alpha value, alpha ∈ [0, 1][$en]
 @return [^zh]若hexStr为非法值，则返回nil[$zh] [^en]return nil if hexStr is illegal[$en]
 */
+ (UIColor *)my_colorWithHexString:(NSString *)hexStr alpha:(CGFloat)alpha;

/**
 @return  [^zh]颜色的16进制ARGB值，形如 @"#FF00FF00"[$zh] [^en]ARGB like @"#FF00FF00"[$en]
 */
- (NSString *)my_ARGBHexString;
/**
 @return [^zh]颜色的16进制RGB值，形如 @"#00FF00"，alpha会被忽略[$zh] [^en]RGB hex string like "#00FF00", alpha will be ignore[$en]
 */
- (NSString *)my_RGBHexString;

@end
