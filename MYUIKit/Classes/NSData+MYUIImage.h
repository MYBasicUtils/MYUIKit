//
//  NSData+MYUIImage.h
//  MYUIKit
//
//  Created by APPLE on 2024/7/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (MYUIImage)

- (NSArray<UIImage *> *)images;

- (CGImageRef)imageAtTime:(NSTimeInterval)time;

@end

NS_ASSUME_NONNULL_END
