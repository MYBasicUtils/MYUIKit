//
//  UIImage+MYGIF.h
//  MYEditorVideo
//
//  Created by APPLE on 2024/7/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (MYGIF)

+ (UIImage *)animatedGIFWithData:(NSData *)data;
+ (NSArray<NSNumber *> *)frameDurationsForGIFData:(NSData *)data;

@end

NS_ASSUME_NONNULL_END
