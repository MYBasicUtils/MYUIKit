//
//  MYLabel.h
//  MYUIKit
//
//  Created by wmy on 2019/5/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MYLabel : UILabel

#pragma mark - EdgeInsets
/**
 [^zh]文本内间距，负值向外[$zh]
 [^en]label edge insets, negative means 'outset'[$en]
 */
@property (nonatomic) UIEdgeInsets my_edgeInsets;


#pragma ParagraphStyle

@property (nonatomic) CGFloat my_lineSpace; ///< [^zh]行间距[$zh][^en]line space[$en]
@property (nonatomic) CGFloat my_wordSpace; ///< [^zh]词间距[$zh][^en]word space[$en]

@property (nonatomic, strong) NSMutableParagraphStyle *my_paragraphStyle;

- (void)my_refreshParagraphStyleImmediately;

@end

NS_ASSUME_NONNULL_END
