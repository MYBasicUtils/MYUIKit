//
//  UIColor+TYRGBA.h
//  MYUIKit
//
//  Created by wmy on 2018/12/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 @param r ∈ [0, 255]
 @param g ∈ [0, 255]
 @param b ∈ [0, 255]
 @param a ∈ [0, 1]
 */
UIKIT_EXTERN UIColor * MY_RGBAColor(NSUInteger r, NSUInteger g, NSUInteger b, CGFloat a);

/**
@param r ∈ [0, 255]
@param g ∈ [0, 255]
@param b ∈ [0, 255]
*/
UIKIT_EXTERN UIColor * MY_RGBColor(NSUInteger r, NSUInteger g, NSUInteger b);

NS_ASSUME_NONNULL_END
