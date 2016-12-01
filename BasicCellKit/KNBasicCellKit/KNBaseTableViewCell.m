//
//  KNBaseTableViewCell.m
//  BasicCellKit
//
//  Created by vbn on 16/11/28.
//  Copyright © 2016年 vbn. All rights reserved.
//

#import "KNBaseTableViewCell.h"


#define KN_ColorFromRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define KN_SINGLE_LINE_WIDTH           (1.0f / [UIScreen mainScreen].scale)

@interface KNBaseTableViewCell ()

@property (assign, nonatomic) BOOL showTopLine;

@property (assign, nonatomic) BOOL showBottomLine;

@property (strong, nonatomic) UIView *topLineView;

@property (strong, nonatomic) UIView *bottomLineView;

@end

@implementation KNBaseTableViewCell

- (UITableView *)getTableView {
    id view = [self superview];
    
    while (view && [view isKindOfClass:[UITableView class]] == NO) {
        view = [view superview];
    }
    
    UITableView *tableView = (UITableView *)view;
    return tableView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self showTopline:YES];
    [self showBottomLine:YES];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self showTopline:YES];
        [self showBottomLine:YES];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)showTopline:(BOOL)show {
    [self layoutIfNeeded];
    self.showTopLine = show;
    self.topLineView.hidden = !show;
}

- (void)showToplineLeftOffset:(CGFloat)leftOffset {
    [self.topLineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(leftOffset);
    }];
    [self layoutIfNeeded];
}

- (void)showTopLineRightOffSet:(CGFloat)rightOffset {
    [self.topLineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(rightOffset);
    }];
     [self layoutIfNeeded];
}

- (void)showBottomLine:(BOOL)show {
    [self layoutIfNeeded];
    self.showBottomLine = show;
    self.bottomLineView.hidden = !show;
    
}

- (void)showBottomLineLeftOffset:(CGFloat)leftOffset {
    [self.bottomLineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(leftOffset);
    }];
    [self layoutIfNeeded];
}

- (void)showBottomLineRightOffSet:(CGFloat)rightOffset {
    [self.bottomLineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(rightOffset);
    }];
    [self layoutIfNeeded];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.topLineView.hidden = NO;
    self.bottomLineView.hidden = NO;
    // 使用默认style
    UITableView *tableView = [self getTableView];
    if (tableView && [tableView isKindOfClass:[UITableView class]]) {
        NSIndexPath *indexPath = [tableView indexPathForRowAtPoint:self.center];
        NSInteger numberOfRowInSec = [tableView numberOfRowsInSection:indexPath.section];
        NSLog(@"%ld - %ld",indexPath.section,indexPath.row);
        // 是第一行也是最后一行，只有一行的情况
        if (indexPath.row == 0 && indexPath.row == (numberOfRowInSec - 1)) {
            self.topLineView.hidden = NO;
            self.bottomLineView.hidden = NO;
        } else if (indexPath.row != (numberOfRowInSec - 1)) {
            self.topLineView.hidden = NO;
            self.bottomLineView.hidden = YES;
        } else {
            self.topLineView.hidden = NO;
            self.bottomLineView.hidden = NO;
        }


    }
}

#pragma mark - helper

+(UIColor*)colorWithHex:(long)hexColor alpha:(float)opacity {
    float red = ((float)((hexColor & 0xFF0000) >> 16))/255.0;
    float green = ((float)((hexColor & 0xFF00) >> 8))/255.0;
    float blue = ((float)(hexColor & 0xFF))/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:opacity];
}

#pragma mark - getter && setter
- (UIView *)topLineView
{
    if (!_topLineView) {
        _topLineView = [[UIView alloc] init];
        [self addSubview:_topLineView];
        [_topLineView setBackgroundColor:[[self class] colorWithHex:0xc8c8c8 alpha:1]];
        [_topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.and.top.equalTo(self);
            make.height.equalTo(@(KN_SINGLE_LINE_WIDTH));
        }];
    }
    return _topLineView;
}

- (UIView *)bottomLineView
{
    if (!_bottomLineView) {
        _bottomLineView = [[UIView alloc] init];
        [self addSubview:_bottomLineView];
        [_bottomLineView setBackgroundColor:[[self class] colorWithHex:0xc8c8c8 alpha:1]];
        [_bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.and.bottom.equalTo(self);
            make.height.equalTo(@(KN_SINGLE_LINE_WIDTH));
        }];
    }
    return _bottomLineView;
}

@end
