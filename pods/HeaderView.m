//
//  HeaderView.m
//  pods
//
//  Created by Edward on 16/7/3.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self isMore];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setIsMore:(BOOL)isMore{
    _isMore = isMore;
    if (_isMore) {
        [self moreBtn];
        [self headIv];
        [self headLb];
    }else{
        [self headIv];
        [self headLb];
    }
}

- (UIImageView *)headIv{
    if (!_headIv) {
        _headIv = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 25, 25)];
        _headIv.image = [UIImage imageNamed:@"sanjiao"];
        _headIv.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_headIv];
    }
    return _headIv;
}

- (UILabel *)headLb{
    if (!_headLb) {
        _headLb = [[UILabel alloc] init];
        _headLb.font = [UIFont systemFontOfSize:15];
        [self addSubview:_headLb];
        [_headLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headIv.mas_right).equalTo(5);
            make.top.equalTo(self.headIv.mas_top);
            make.bottom.equalTo(self.headIv.mas_bottom);
            make.width.equalTo(70);
        }];
        [_headLb sizeToFit];
    }
    return _headLb;
}

- (UIButton *)moreBtn{
    if (!_moreBtn) {
        _moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_moreBtn];
        [_moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.headIv.mas_top);
            make.bottom.equalTo(self.headIv.mas_bottom);
            make.right.equalTo(-20);
            make.width.equalTo(50);
        }];
        
        [_moreBtn setTitle:@"更多>" forState:UIControlStateNormal];
        [_moreBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//btn的字体居右
        [_moreBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        _moreBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _moreBtn;
}


@end
