//
//  UIView+MYFrame.h
//  MYBookkeeping
//
//  Created by wmy on 2018/12/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

UIKIT_EXTERN CGFloat MY_PixelAlignedLength(CGFloat length);
UIKIT_EXTERN CGPoint MY_PixelAlignedPoint(CGPoint point);
UIKIT_EXTERN CGSize MY_PixelAlignedSize(CGSize size);
UIKIT_EXTERN CGRect MY_PixelAlignedRect(CGRect rect);

@interface UIView (MYFrame)

/**
 * Shortcut for frame.origin.x.
 *
 * Sets frame.origin.x = left
 */
@property (nonatomic) CGFloat my_left;

/**
 * Shortcut for frame.origin.y
 *
 * Sets frame.origin.y = top
 */
@property (nonatomic) CGFloat my_top;

/**
 * Shortcut for frame.origin.x + frame.size.width
 *
 * Sets frame.origin.x = right - frame.size.width
 */
@property (nonatomic) CGFloat my_right;

/**
 * Shortcut for frame.origin.y + frame.size.height
 *
 * Sets frame.origin.y = bottom - frame.size.height
 */
@property (nonatomic) CGFloat my_bottom;

/**
 * Shortcut for frame.size.width
 *
 * Sets frame.size.width = width
 */
@property (nonatomic) CGFloat my_width;

/**
 * Shortcut for frame.size.height
 *
 * Sets frame.size.height = height
 */
@property (nonatomic) CGFloat my_height;

/**
 * Shortcut for center.x
 *
 * Sets center.x = centerX
 */
@property (nonatomic) CGFloat my_centerX;

/**
 * Shortcut for center.y
 *
 * Sets center.y = centerY
 */
@property (nonatomic) CGFloat my_centerY;

/**
 * Shortcut for frame.origin
 */
@property (nonatomic) CGPoint my_origin;

/**
 * Shortcut for frame.size
 */
@property (nonatomic) CGSize my_size;


@end

NS_ASSUME_NONNULL_END
