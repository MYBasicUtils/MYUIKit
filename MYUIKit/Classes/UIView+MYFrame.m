//
//  UIView+MYFrame.m
//  MYBookkeeping
//
//  Created by wmy on 2018/12/17.
//

#import "UIView+MYFrame.h"

inline CGFloat MY_PixelAlignedLength(CGFloat length) {
    return roundf(length * UIScreen.mainScreen.scale) / UIScreen.mainScreen.scale;
}
inline CGPoint MY_PixelAlignedPoint(CGPoint point) {
    return CGPointMake(MY_PixelAlignedLength(point.x), MY_PixelAlignedLength(point.y));
}
inline CGSize MY_PixelAlignedSize(CGSize size) {
    return CGSizeMake(MY_PixelAlignedLength(size.width), MY_PixelAlignedLength(size.height));
}
inline CGRect MY_PixelAlignedRect(CGRect rect) {
    CGPoint origin = MY_PixelAlignedPoint(rect.origin);
    CGSize size = MY_PixelAlignedSize(rect.size);
    return CGRectMake(origin.x, origin.y, size.width, size.height);
}


@implementation UIView (MYFrame)

- (CGFloat)my_left {
    return self.frame.origin.x;
}

- (void)setMy_left:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}


- (CGFloat)my_top {
    return self.frame.origin.y;
}


- (void)setMy_top:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}


- (CGFloat)my_right {
    return self.frame.origin.x + self.frame.size.width;
}


- (void)setMy_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}


- (CGFloat)my_bottom {
    return self.frame.origin.y + self.frame.size.height;
}


- (void)setMy_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}


- (CGFloat)my_centerX {
    return self.center.x;
}


- (void)setMy_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}


- (CGFloat)my_centerY {
    return self.center.y;
}


- (void)setMy_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}


- (CGFloat)my_width {
    return self.frame.size.width;
}


- (void)setMy_width:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}


- (CGFloat)my_height {
    return self.frame.size.height;
}


- (void)setMy_height:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGPoint)my_origin {
    return self.frame.origin;
}


- (void)setMy_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}


- (CGSize)my_size {
    return self.frame.size;
}

- (void)setMy_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

@end
