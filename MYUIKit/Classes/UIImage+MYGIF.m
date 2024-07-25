//
//  UIImage+MYGIF.m
//  MYEditorVideo
//
//  Created by APPLE on 2024/7/22.
//

#import "UIImage+MYGIF.h"

@implementation UIImage (MYGIF)


+ (UIImage *)animatedGIFWithData:(NSData *)data {
    if (!data) {
        return nil;
    }

    CGImageSourceRef source = CGImageSourceCreateWithData((CFDataRef)data, NULL);
    if (!source) {
        return nil;
    }

    size_t count = CGImageSourceGetCount(source);
    NSMutableArray *images = [NSMutableArray array];
    NSTimeInterval duration = 0.0;

    for (size_t i = 0; i < count; i++) {
        CGImageRef image = CGImageSourceCreateImageAtIndex(source, i, NULL);
        if (!image) {
            continue;
        }

        NSDictionary *properties = (__bridge_transfer NSDictionary *)CGImageSourceCopyPropertiesAtIndex(source, i, NULL);
        NSDictionary *gifProperties = properties[(NSString *)kCGImagePropertyGIFDictionary];
        NSNumber *delayTime = gifProperties[(NSString *)kCGImagePropertyGIFDelayTime];

        duration += delayTime.doubleValue;
        [images addObject:[UIImage imageWithCGImage:image]];
        CGImageRelease(image);
    }

    CFRelease(source);

    if (!images.count) {
        return nil;
    }

    return [UIImage animatedImageWithImages:images duration:duration];
}

+ (NSArray<NSNumber *> *)frameDurationsForGIFData:(NSData *)data {
    if (!data) {
        return nil;
    }

    CGImageSourceRef source = CGImageSourceCreateWithData((CFDataRef)data, NULL);
    if (!source) {
        return nil;
    }

    size_t count = CGImageSourceGetCount(source);
    NSMutableArray<NSNumber *> *frameDurations = [NSMutableArray array];

    for (size_t i = 0; i < count; i++) {
        NSDictionary *properties = (__bridge_transfer NSDictionary *)CGImageSourceCopyPropertiesAtIndex(source, i, NULL);
        NSDictionary *gifProperties = properties[(NSString *)kCGImagePropertyGIFDictionary];
        NSNumber *delayTime = gifProperties[(NSString *)kCGImagePropertyGIFDelayTime];
        [frameDurations addObject:delayTime];
    }

    CFRelease(source);
    return [frameDurations copy];
}
@end
