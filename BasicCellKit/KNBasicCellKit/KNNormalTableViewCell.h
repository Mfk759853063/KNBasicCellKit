//
//  KNNormalTableViewCell.h
//  BasicCellKit
//
//  Created by vbn on 16/11/28.
//  Copyright © 2016年 vbn. All rights reserved.
//

#import "KNBaseTableViewCell.h"

@interface KNNormalTableViewCell : KNBaseTableViewCell

// 设置iconImage 控制是否有图片
@property (strong, nonatomic) UIImage *iconImage;

@property (strong, nonatomic) UILabel *titleLabel;

@property (strong, nonatomic) UILabel *descripLabel;

@property (strong, nonatomic) UIImageView *iconImageView;

// default is 25
@property (assign, nonatomic) CGFloat iconWidth;

// default is 25
@property (assign, nonatomic) CGFloat iconHeight;

// default is 10
@property (assign, nonatomic) CGFloat titleLeftIconSpacing;

// default is 14
@property (assign, nonatomic) CGFloat iconLeftSpacing;

@end
