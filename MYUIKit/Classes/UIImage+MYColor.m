//
//  UIImage+MYColor.m
//  MYUIKit
//
//  Created by wmy on 2018/11/27.
//

#import "UIImage+MYColor.h"

#import "UIImage+MYLayer.h"

@implementation UIImage (MYColor)

+ (UIImage *)my_imageWithColor:(UIColor *)color {
    return [self my_imageWithColor:color size:CGSizeMake(1, 1)];
}

+ (UIImage *)my_imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)my_imageWithGradient:(CAGradientLayerType)type colors:(NSArray<UIColor *> *)colors locations:(NSArray<NSNumber *> *)locations startPoint:(CGPoint)start endPoint:(CGPoint)end size:(CGSize)size {
    CAGradientLayer *layer = [CAGradientLayer new];
    layer.frame = CGRectMake(0, 0, size.width, size.height);
    NSMutableArray *colorArr = [NSMutableArray new];
    for (UIColor *color in colors) {
        if ([color isKindOfClass:[UIColor class]]) {
            [colorArr addObject:(id)color.CGColor];
        }
    }
    layer.colors = colorArr;
    layer.startPoint = start;
    layer.endPoint = end;
    
    return [UIImage my_imageWithLayer:layer];
}

@end
