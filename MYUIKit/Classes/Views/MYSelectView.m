//
//  MYSelectView.m
//  MYBookkeeping
//
//  Created by WenMingYan on 2022/2/5.
//

#import "MYSelectView.h"
#import <MYSkin/MYSkin.h>
#import <Masonry/Masonry.h>
#import <MYUIKit/MYUIKit.h>
#import <MYUtils/MYUtils.h>

@interface MYSelectView ()

@property (nonatomic, strong) NSArray<NSString *> *items;
@property (nonatomic, strong) NSMutableArray<UIButton *> *itemBtns;
@property (nonatomic, strong) UIStackView *stackView;
@property (nonatomic, assign) NSInteger selectedIndex;/**< 选中  */

@end

@implementation MYSelectView


#pragma mark - dealloc
#pragma mark - life cycle
- (instancetype)init {
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView {
    self.clipsToBounds = YES;
    self.backgroundColor = TheSkin.backColor;
    self.layer.cornerRadius = TheSkin.halfSpace;
    [self addSubview:self.stackView];
    [self.stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(2);
        make.right.bottom.mas_equalTo(-2);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initView];
}

#pragma mark - Event Response

- (void)setItems:(NSArray<NSString *> *)items {
    _items = items;
    for (UIView *view in self.stackView.subviews) {
        [view removeFromSuperview];
    }
    [self.itemBtns removeAllObjects];
    for (int i = 0; i < items.count; i++) {
        UIButton *button = [self configBtn];
        [button setTitle:items[i] forState:UIControlStateNormal];
        [self.itemBtns addObject:button];
        button.tag = i;
        [self.stackView addArrangedSubview:button];
    }
    self.selectedIndex = 0;
}

- (UIButton *)configBtn {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.layer.cornerRadius = TheSkin.halfSpace;
    btn.clipsToBounds = YES;
    CGFloat top = 5;
    CGFloat left = 10;
    btn.contentEdgeInsets = UIEdgeInsetsMake(top, left, top, left);
    [btn setTitleColor:TheSkin.titleColor
              forState:UIControlStateNormal];
    btn.titleLabel.font = TheSkin.guideTitleFont;
    [btn addTarget:self action:@selector(onClickBtn:)
  forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundImage:[UIImage my_imageWithColor:TheSkin.backColor]
                   forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage my_imageWithColor:TheSkin.whiteColor]
                   forState:UIControlStateSelected];
    return btn;
}

- (void)onClickBtn:(UIButton *)btn {
    NSInteger selectIndex = btn.tag;
    self.selectedIndex = selectIndex;
    //TODO: wmy delegate
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    UIButton *lastBtn = [self.itemBtns my_safeObjectAtIndex:_selectedIndex];
    lastBtn.selected = NO;
    _selectedIndex = selectedIndex;
    lastBtn = [self.itemBtns my_safeObjectAtIndex:_selectedIndex];
    lastBtn.selected = YES;
}

#pragma mark - private methods
#pragma mark - getters & setters & init members

- (UIStackView *)stackView {
    if (!_stackView) {
        _stackView = [[UIStackView alloc] init];
        _stackView.axis = UILayoutConstraintAxisHorizontal;
    }
    return _stackView;
}

- (NSMutableArray<UIButton *> *)itemBtns {
    if (!_itemBtns) {
        _itemBtns = [NSMutableArray<UIButton *> array];
    }
    return _itemBtns;
}

@end
