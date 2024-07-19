//
//  MYDialogView.m
//  MYUIKit
//
//  Created by APPLE on 2024/7/19.
//

#import "MYDialogView.h"
#import <Masonry/Masonry.h>
#import <MYSkin/MYSkin.h>
#import <MYUIKit/MYUIKit.h>

@interface MYDialogView ()

@property (nonatomic, strong) UIButton *doneBtn;
@property (nonatomic, strong) UIView *contentView;

@end

@implementation MYDialogView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    self.backgroundColor = TheSkin.blackColor;
    [self addSubview:self.doneBtn];
    [self addSubview:self.contentView];
    [self.doneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-TheSkin.space);
        make.top.equalTo(self).offset(TheSkin.space);
    }];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.mas_equalTo(self.doneBtn.mas_bottom);
        make.bottom.equalTo(self);
    }];
}
- (void)addContentView:(UIView *)view {
    [self.contentView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
}

- (void)onClickDone {
    if (self.clickBlock) {
        self.clickBlock();
    }
}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [UIView new];
#if DEBUG
        _contentView.layer.borderWidth = 1;
        _contentView.layer.borderColor = UIColor.redColor.CGColor;
#endif
    }
    return _contentView;
}


- (UIButton *)doneBtn {
    if (!_doneBtn) {
        _doneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_doneBtn setTitle:@"OK" forState:UIControlStateNormal];
        [_doneBtn addTarget:self action:@selector(onClickDone) forControlEvents:UIControlEventTouchUpInside];
        _doneBtn.clipsToBounds = YES;
        _doneBtn.layer.cornerRadius = 24.0f;
        _doneBtn.titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightMedium];
    }
    return _doneBtn;
}

@end
