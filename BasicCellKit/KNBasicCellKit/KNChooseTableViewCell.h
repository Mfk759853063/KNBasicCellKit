//
//  KNChooseTableViewCell.h
//  BasicCellKit
//
//  Created by vbn on 16/11/28.
//  Copyright © 2016年 vbn. All rights reserved.
//

#import "KNNormalTableViewCell.h"

@interface KNChooseTableViewCell : KNNormalTableViewCell

// default is 14
@property (assign, nonatomic) CGFloat selectButtonLeft;

@property (strong, nonatomic) UIButton *selectButton;

@end
