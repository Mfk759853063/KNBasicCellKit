//
//  KNChooseTableViewCell.m
//  BasicCellKit
//
//  Created by vbn on 16/11/28.
//  Copyright © 2016年 vbn. All rights reserved.
//

#import "KNChooseTableViewCell.h"

@implementation KNChooseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectButtonLeft = 14;
        
        [self.contentView addSubview:self.selectButton];
        [self.selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(self.selectButtonLeft));
            make.width.and.height.equalTo(@22);
            make.centerY.equalTo(self.contentView);
        }];
        
        [self.iconImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.selectButton.mas_right).offset(self.iconLeftSpacing);
            make.centerY.equalTo(self.contentView);
            make.width.and.height.equalTo(@0);
        }];
        
    }
    return self;
}

#pragma mark - getter

- (UIButton *)selectButton
{
    if (!_selectButton) {
        _selectButton = [[UIButton alloc] init];
        [_selectButton setImage:[UIImage imageNamed:@"btn_gou_v3"] forState:UIControlStateSelected];
        [_selectButton setImage:[UIImage imageNamed:@"btn_quan"] forState:UIControlStateNormal];
    }
    return _selectButton;
}
@end
