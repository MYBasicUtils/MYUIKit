//
//  UIColor+MYOpacity.m
//  MYPropertyWorkbenchUISkin
//
//  Created by NeroXie on 2021/2/23.
//

#import "UIColor+MYOpacity.h"

@implementation UIColor (MYOpacity)

- (UIColor *)colorWithOpacity:(CGFloat)opacity {
    CGFloat r = 0.0, g = 0.0, b = 0.0, a = 0.0;
    [self getRed:&r green:&g blue:&b alpha:&a];
    
    return [UIColor colorWithRed:r green:g blue:b alpha:a * opacity];
}

@end
