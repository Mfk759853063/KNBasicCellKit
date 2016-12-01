//
//  KNNormalTableViewCell.m
//  BasicCellKit
//
//  Created by vbn on 16/11/28.
//  Copyright © 2016年 vbn. All rights reserved.
//

#import "KNNormalTableViewCell.h"
#import "Masonry.h"

@interface KNNormalTableViewCell ()

@end

@implementation KNNormalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.iconWidth = 25;
        self.iconHeight = 25;
        self.titleLeftIconSpacing = 10;
        self.iconLeftSpacing = 14;
        [self.contentView addSubview:self.descripLabel];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.iconImageView];
        
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(self.iconLeftSpacing));
            make.centerY.equalTo(self.contentView);
            make.width.and.height.equalTo(@0);
        }];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageView.mas_right).offset(self.titleLeftIconSpacing);
            make.centerY.equalTo(self.contentView);
        }];
        
        [self.descripLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel.mas_right).offset(10);
            make.right.equalTo(self.contentView).offset(-14);
            make.centerY.equalTo(self.contentView);
        }];
    }
    return self;
}

- (void)setIconImage:(UIImage *)iconImage {
    _iconImage = iconImage;
    self.iconImageView.image = iconImage;
    if (iconImage) {
        [self.iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(self.iconWidth));
            make.height.equalTo(@(self.iconHeight));
        }];
        [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageView.mas_right).offset(self.titleLeftIconSpacing);
        }];
    } else {
        [self.iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(@0);
        }];
        [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageView.mas_right).offset(0);
        }];
    }
}

#pragma mark - getter

- (UILabel *)descripLabel
{
    if (!_descripLabel) {
        _descripLabel = [[UILabel alloc] init];
        _descripLabel.textColor = [UIColor darkGrayColor];
        _descripLabel.font = [UIFont systemFontOfSize:13];
    }
    return _descripLabel;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:13];
    }
    return _titleLabel;
}

- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
    }
    return _iconImageView;
}
@end
