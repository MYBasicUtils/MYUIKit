//
//  UIImage+MYLayer.h
//  MYUIKit
//
//  Created by wmy on 2018/11/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (MYLayer)

+ (UIImage *)my_imageWithLayer:(CALayer *)layer;
+ (UIImage *)my_imageWithView:(UIView *)view;
+ (UIImage *)my_imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;

@end

NS_ASSUME_NONNULL_END
