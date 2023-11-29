//
//  MYLabel.m
//  MYUIKit
//
//  Created by wmy on 2019/5/13.
//

#import "MYLabel.h"

@interface MYLabel ()

@property (nonatomic) BOOL my_needRefreshParagraphStyle;

@end

@implementation MYLabel

#pragma mark - Override
- (void)setText:(NSString *)text {
    [super setText:text];
    if (self.my_paragraphStyle || self.my_lineSpace > 0 || self.my_wordSpace > 0) {
        self.my_needRefreshParagraphStyle = YES;
    }
}

#pragma mark - Private
- (void)my_updateParagraphStyle {
    NSMutableDictionary *attr = [NSMutableDictionary new];
    
    if (self.my_wordSpace > 0) {
        [attr setValue:@(self.my_wordSpace) forKey:NSKernAttributeName];
    }
    
    NSMutableParagraphStyle *paragraphStyle = self.my_paragraphStyle;
    if (self.my_lineSpace > 0) {
        if (paragraphStyle == nil) {
            paragraphStyle = [NSMutableParagraphStyle new];
            _my_paragraphStyle = paragraphStyle;
        }
        if ([paragraphStyle isKindOfClass:[NSMutableParagraphStyle class]]) {
            paragraphStyle.lineSpacing = self.my_lineSpace;
        }
    }
    if (paragraphStyle) {
        [attr setValue:paragraphStyle forKey:NSParagraphStyleAttributeName];
    }
    
    if (attr.count > 0 && [self.text isKindOfClass:[NSString class]]) {
        NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:self.text attributes:attr];
        self.attributedText = attrStr;
    }
    
    _my_needRefreshParagraphStyle = NO;
}

- (void)drawTextInRect:(CGRect)rect {
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.my_edgeInsets)];
}

- (CGSize)intrinsicContentSize {
    CGSize size = [super intrinsicContentSize];
    size.width += self.my_edgeInsets.left + self.my_edgeInsets.right;
    size.height += self.my_edgeInsets.top + self.my_edgeInsets.bottom;
    return size;
}

- (CGSize)sizeThatFits:(CGSize)fitsSize {
    CGSize size = [super sizeThatFits:fitsSize];
    size.width += self.my_edgeInsets.left + self.my_edgeInsets.right;
    size.height += self.my_edgeInsets.top + self.my_edgeInsets.bottom;
    return size;
}

#pragma mark - Public
- (void)my_refreshParagraphStyleImmediately {
    [self my_updateParagraphStyle];
}

#pragma mark - Accessor
- (void)setTy_lineSpace:(CGFloat)my_lineSpace {
    if (_my_lineSpace != my_lineSpace) {
        _my_lineSpace = my_lineSpace;
        if (self.text && self.text.length > 0) {
            self.my_needRefreshParagraphStyle = YES;
        }
    }
}

- (void)setTy_wordSpace:(CGFloat)my_wordSpace {
    if (_my_wordSpace != my_wordSpace) {
        _my_wordSpace = my_wordSpace;
        if (self.text && self.text.length > 0) {
            self.my_needRefreshParagraphStyle = YES;
        }
    }
}

- (void)setTy_paragraphStyle:(NSMutableParagraphStyle *)my_paragraphStyle {
    _my_paragraphStyle = my_paragraphStyle;
    if (self.text && self.text.length > 0) {
        self.my_needRefreshParagraphStyle = YES;
    }
}

- (void)setmy_edgeInsets:(UIEdgeInsets)my_edgeInsets {
    if (!UIEdgeInsetsEqualToEdgeInsets(_my_edgeInsets, my_edgeInsets)) {
        _my_edgeInsets = my_edgeInsets;
        if (self.text && self.text.length > 0) {
            [self setNeedsDisplay];
        }
    }
}

#pragma mark - Refresh
- (void)setTy_needRefreshParagraphStyle:(BOOL)flag {
    if (self.my_needRefreshParagraphStyle != flag) {
        _my_needRefreshParagraphStyle = flag;
        if (flag) {
            __weak typeof(self) weakSelf = self;
            typeof(weakSelf) strongSelf = weakSelf;
            if (strongSelf.my_needRefreshParagraphStyle) {
                [strongSelf my_updateParagraphStyle];
            }
        }
    }
}

@end
