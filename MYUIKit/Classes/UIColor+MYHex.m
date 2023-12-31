//
//  UIColor+TYHex.m
//  MYUIKit
//
//  Created by wmy on 2018/12/17.
//

#import "UIColor+MYHex.h"

inline UIColor * MY_HexColor(uint32_t hex) {
    return [UIColor my_colorWithHex:hex];
}

inline UIColor * MY_HexAlphaColor(uint32_t hex, CGFloat alpha) {
    return [UIColor my_colorWithHex:hex alpha:alpha];
}


@implementation UIColor (TYHex)

+ (UIColor *)my_colorWithHex:(uint32_t)hex {
    CGFloat preAlpha = ((float)((hex & 0xFF000000) >> 24))/255.0f;
    CGFloat alpha = preAlpha > 0 ? preAlpha : 1;
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0
                           green:((float)((hex & 0xFF00) >> 8))/255.0
                            blue:((float)(hex & 0xFF))/255.0 alpha:alpha];
}

+ (UIColor *)my_colorWithHexString:(NSString *)hexColor {
    if (![hexColor isKindOfClass:[NSString class]]) {
        return nil;
    }
    NSString *colorStr = [[hexColor stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([colorStr length] < 6 || [colorStr length] > 9) {
        return nil;
    }
    if ([colorStr hasPrefix:@"#"]) {
        colorStr = [colorStr substringFromIndex:1];
    }
    
    unsigned int hex;
    [[NSScanner scannerWithString:colorStr] scanHexInt:&hex];
    return [self my_colorWithHex:hex];
}

+ (UIColor *)my_colorWithHex:(uint32_t)hex alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0
                           green:((float)((hex & 0xFF00) >> 8))/255.0
                            blue:((float)(hex & 0xFF))/255.0 alpha:alpha];
}

+ (UIColor *)my_colorWithHexString:(NSString *)hexColor alpha:(CGFloat)alpha {
    if (![hexColor isKindOfClass:[NSString class]]) {
        return nil;
    }
    NSString *colorStr = [[hexColor stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([colorStr length] < 6 || [colorStr length] > 7) {
        return nil;
    }
    if ([colorStr hasPrefix:@"#"]) {
        colorStr = [colorStr substringFromIndex:1];
    }
    
    // Scan values
    unsigned int hex;
    [[NSScanner scannerWithString:colorStr] scanHexInt:&hex];
    return [self my_colorWithHex:hex alpha:alpha];
}

- (NSString *)my_ARGBHexString {
    CGFloat r, g, b, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    int argb =  (int) (a * 255.0f)<<24 | (int) (r * 255.0f)<<16 | (int) (g * 255.0f)<<8 | (int) (b * 255.0f)<<0;
    return [NSString stringWithFormat:@"#%08x", argb];
}

- (NSString *)my_RGBHexString {
    CGFloat r, g, b, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    int rgb = (int) (r * 255.0f)<<16 | (int) (g * 255.0f)<<8 | (int) (b * 255.0f)<<0;
    return [NSString stringWithFormat:@"#%06x", rgb];
}

@end
