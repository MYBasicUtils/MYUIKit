//
//  MYDialog.h
//  CocoaLumberjack
//
//  Created by APPLE on 2024/7/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MYDialog : NSObject

+ (instancetype)showDialogWithView:(UIView *)view;
- (void)dismiss;

@end

NS_ASSUME_NONNULL_END
