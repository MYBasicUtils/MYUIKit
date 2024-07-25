//
//  NSData+MYUIImage.m
//  MYUIKit
//
//  Created by APPLE on 2024/7/22.
//

#import "NSData+MYUIImage.h"

@implementation NSData (MYUIImage)

- (NSArray<UIImage *> *)images {
    // 创建GIF图像源
    CGImageSourceRef source = CGImageSourceCreateWithData((CFDataRef)self, NULL);
    if (!source) {
        return nil;
    }

    // 获取总帧数
    size_t count = CGImageSourceGetCount(source);

    // 创建一个数组来存储每一帧的图像
    NSMutableArray<UIImage *> *frames = [NSMutableArray arrayWithCapacity:count];

    for (size_t i = 0; i < count; i++) {
        // 获取每一帧的图像
        CGImageRef imageRef = CGImageSourceCreateImageAtIndex(source, i, NULL);
        if (imageRef) {
            UIImage *image = [UIImage imageWithCGImage:imageRef];
            [frames addObject:image];
            CGImageRelease(imageRef);
        }
    }

    CFRelease(source);
    return [frames copy];
}

- (CGImageRef)imageAtTime:(NSTimeInterval)time {
   // 创建GIF图像源
   CGImageSourceRef source = CGImageSourceCreateWithData((CFDataRef)self, NULL);
   if (!source) {
       return NULL;
   }

   // 获取总帧数
   size_t count = CGImageSourceGetCount(source);

   // 遍历每一帧，计算时间并找到指定时间点的帧
   NSTimeInterval currentTime = 0.0;
   CGImageRef targetImage = NULL;

   for (size_t i = 0; i < count; i++) {
       // 获取帧的属性
       NSDictionary *properties = (__bridge_transfer NSDictionary *)CGImageSourceCopyPropertiesAtIndex(source, i, NULL);
       NSDictionary *gifProperties = properties[(NSString *)kCGImagePropertyGIFDictionary];
       NSNumber *delayTime = gifProperties[(NSString *)kCGImagePropertyGIFDelayTime];

       currentTime += delayTime.doubleValue;

       if (currentTime >= time) {
           // 找到目标时间点的帧
           targetImage = CGImageSourceCreateImageAtIndex(source, i, NULL);
           break;
       }
   }

   CFRelease(source);
   return targetImage;
}
@end
