//
//  UIImage+MYLayer.m
//  MYUIKit
//
//  Created by wmy on 2018/11/27.
//

#import "UIImage+MYLayer.h"

@implementation UIImage (MYLayer)

+ (UIImage *)my_imageWithLayer:(CALayer *)layer {
    UIGraphicsBeginImageContextWithOptions(layer.bounds.size, layer.opaque, 0);
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (UIImage *)my_imageWithView:(UIView *)view {
    return [self my_imageWithLayer:view.layer];
}

+ (UIImage *)my_imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
@end
