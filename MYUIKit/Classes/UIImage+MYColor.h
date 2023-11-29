//
//  UIImage+MYColor.h
//  MYUIKit
//
//  Created by wmy on 2018/11/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (MYColor)

/**
 [^zh]将颜色绘制成图片[$zh]
 [^en]Create image with color[$en]
 */
+ (UIImage *)my_imageWithColor:(UIColor *)color;

/**
[^zh]将颜色绘制成图片，并指定大小[$zh]
[^en]Create image with color and size[$en]
*/
+ (UIImage *)my_imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 [^zh]渲染渐变颜色图[$zh]
 [^en]Create gradient image with colors[$en]
 */
+ (UIImage *)my_imageWithGradient:(CAGradientLayerType)type colors:(NSArray<UIColor *> *)colors locations:(NSArray<NSNumber *> *)locations startPoint:(CGPoint)start endPoint:(CGPoint)end size:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
