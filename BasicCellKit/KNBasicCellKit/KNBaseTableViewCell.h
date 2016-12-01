//
//  KNBaseTableViewCell.h
//  BasicCellKit
//
//  Created by vbn on 16/11/28.
//  Copyright © 2016年 vbn. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Masonry.h"

@interface KNBaseTableViewCell : UITableViewCell

- (void)showTopline:(BOOL)show;

- (void)showBottomLine:(BOOL)show;

- (void)showToplineLeftOffset:(CGFloat)leftOffset;

- (void)showTopLineRightOffSet:(CGFloat)rightOffset;

- (void)showBottomLineLeftOffset:(CGFloat)leftOffset;

- (void)showBottomLineRightOffSet:(CGFloat)rightOffset;

@end
