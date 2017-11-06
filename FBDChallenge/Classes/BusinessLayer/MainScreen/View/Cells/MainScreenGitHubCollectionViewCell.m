//
//  MainScreenGitHubCollectionViewCell.m
//  FBDChallenge
//
//  Created by Ilkhom on 10/21/17.
//  Copyright © 2017 Test. All rights reserved.
//

#import "MainScreenGitHubCollectionViewCell.h"

@implementation MainScreenGitHubCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor notForkedColor];
    
    _repoNameLbl = [UILabel new];
    _repoNameLbl.font = [UIFont systemFontOfSize:16 weight:UIFontWeightBold];
    _repoNameLbl.numberOfLines = 0;
    
    _ownerLoginLbl = [UILabel new];
    _ownerLoginLbl.font = [UIFont systemFontOfSize:16];
    _ownerLoginLbl.numberOfLines = 0;
    
    _repoDescriptionLbl = [UILabel new];
    _repoDescriptionLbl.font = [UIFont systemFontOfSize:14];
    _repoDescriptionLbl.numberOfLines = 0;
    
    [self addSubview:_repoNameLbl];
    [self addSubview:_ownerLoginLbl];
    [self addSubview:_repoDescriptionLbl];
    
    [self setNeedsUpdateConstraints];
    
    return self;
}

- (void)prepareForReuse {
    _repoNameLbl.text = @"";
    _ownerLoginLbl.text = @"";
    _repoDescriptionLbl.text = @"";
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    [self.repoNameLbl mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self).offset(2);
        make.right.equalTo(self).offset(-2);
        make.height.equalTo(@20).priority(250);
    }];
    [self.ownerLoginLbl mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.repoNameLbl.mas_bottom).offset(4);
        make.left.equalTo(self).offset(2);
        make.right.equalTo(self).offset(-2);
        make.height.equalTo(@20).priority(251);
    }];
    [self.repoDescriptionLbl mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.ownerLoginLbl.mas_bottom).offset(4);
        make.left.equalTo(self).offset(2);
        make.right.equalTo(self).offset(-2);
        make.bottom.equalTo(self).offset(-2);
    }];
    
    [super updateConstraints];
}

- (void)setIsForked:(BOOL)isForked {
    self.backgroundColor = isForked ? [UIColor forkedColor] : [UIColor notForkedColor];
}

@end
