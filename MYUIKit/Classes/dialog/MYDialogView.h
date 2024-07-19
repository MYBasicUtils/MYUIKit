//
//  MYDialogView.h
//  MYUIKit
//
//  Created by APPLE on 2024/7/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^DialogClickOkBlock)(void);

@interface MYDialogView : UIView

@property (nonatomic, copy) DialogClickOkBlock clickBlock;

@property (nonatomic, strong) id dialog;

- (void)addContentView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
