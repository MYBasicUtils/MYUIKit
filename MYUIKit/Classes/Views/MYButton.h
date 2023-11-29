//
//  MYButton.h
//  MYBookkeeping
//
//  Created by WenMingYan on 2022/2/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    MYButtonImageLocationLeft,  ///< [^zh]图片在左侧[$zh] [^en]the image is on the left[$en]
    MYButtonImageLocationRight, ///< [^zh]图片在右侧[$zh] [^en]the image is on the right[$en]
    MYButtonImageLocationTop,   ///< [^zh]图片在上方[$zh] [^en]the image is on the top[$en]
    MYButtonImageLocationBottom ///< [^zh]图片在下方[$zh] [^en]the image is on the bottom[$en]
} MYButtonImageLocation;

@interface MYButton : UIButton

/*
 [^zh]图片相对按钮的位置[$zh]
 [^zh]position of the image relative to the button[$zh]
 */
@property (nonatomic) MYButtonImageLocation my_imageLocation;

/*
 [^zh]图片和标题的间距[$zh]
 [^en]space between image and title[$en]
 */
@property (nonatomic) CGFloat my_imageTitleSpace;

- (void)my_setBackgroundColor:(UIColor *)color forState:(UIControlState)state;
- (UIColor *)my_backgroundColorForState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
