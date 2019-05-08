//
//  ZYSkeletonBaseCell.m
//  tieba
//
//  Created by zuiyou on 2019/4/9.
//  Copyright © 2019年 XiaoChuan Technology Co.,Ltd. All rights reserved.
//

#import "ZYSkeletonBaseCell.h"
#import "FBShimmeringView.h"
#import "ZYSkeletonModel.h"

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kSkeletonLeftMargin   15.0
#define kSkeletonTopMargin    15.0
#define kSkeletonAvatarWidth  34.0
#define kSkeletonBottomMargin 15.0

@interface ZYSkeletonBaseCell ()

@property (nonatomic, strong) FBShimmeringView *shimmeringView;
@property (nonatomic, strong) UIView *avatarView;
@property (nonatomic, strong) UIView *firstLine;
@property (nonatomic, strong) UIView *secondLine;
@property (nonatomic, strong) UIView *thirdLine;

@end


@implementation ZYSkeletonBaseCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubViews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setupSubViews {
    
    _shimmeringView = [[FBShimmeringView alloc] initWithFrame:CGRectZero];
    _shimmeringView.shimmering = YES;
    _shimmeringView.shimmeringBeginFadeDuration = 0.3;
    _shimmeringView.shimmeringOpacity = 0.3;
    _shimmeringView.shimmeringSpeed = 300;
    [self addSubview:_shimmeringView];
    
    _avatarView = [[UIView alloc] initWithFrame:CGRectZero];
    _avatarView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_avatarView];
    
    _firstLine = [[UIView alloc] initWithFrame:CGRectZero];
    _firstLine.backgroundColor = [UIColor whiteColor];
    [self addSubview:_firstLine];
    
    _secondLine = [[UIView alloc] initWithFrame:CGRectZero];
    _secondLine.backgroundColor = [UIColor whiteColor];
    [self addSubview:_secondLine];
    
    _thirdLine = [[UIView alloc] initWithFrame:CGRectZero];
    _thirdLine.backgroundColor = [UIColor whiteColor];
    [self addSubview:_thirdLine];
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    contentView.backgroundColor = [UIColor colorWithRed:204.0 / 255.0 green:204.0 / 255.0 blue:204.0 / 255.0 alpha:1];
    _shimmeringView.contentView = contentView;
    
}

#pragma mark API

+ (CGFloat)cellHeightWithModel:(ZYSkeletonModel *)model {
    if (model.type == ZYSkeletonHeadView) {
        return 160;
    } else {
        return 80;
    }
}

- (void)configViewWithModel:(ZYSkeletonModel *)model {
    if (model.type == ZYSkeletonHeadView) {
        
        _shimmeringView.frame = CGRectMake(0, 0, kScreenWidth, [[self class] cellHeightWithModel:model]);
        _avatarView.frame = CGRectMake(kSkeletonLeftMargin, kSkeletonTopMargin, kSkeletonAvatarWidth, kSkeletonAvatarWidth);
        _avatarView.layer.cornerRadius = _avatarView.frame.size.height / 2;
        _avatarView.layer.masksToBounds = YES;
        _firstLine.frame = CGRectMake(_avatarView.frame.origin.x, (_avatarView.frame.origin.y + _avatarView.frame.size.height) + kSkeletonBottomMargin, kScreenWidth - 90 * kScreenWidth / 375, 15);
        _secondLine.frame = CGRectMake(_avatarView.frame.origin.x, (_firstLine.frame.origin.y + _firstLine.frame.size.height) + kSkeletonBottomMargin, kScreenWidth - 90 * kScreenWidth / 375, 15);
        _thirdLine.frame = CGRectMake(_avatarView.frame.origin.x, (_secondLine.frame.origin.y + _secondLine.frame.size.height) + kSkeletonBottomMargin, kScreenWidth - 90 * kScreenWidth / 375, 15);
    } else {
        _shimmeringView.frame = CGRectMake(0, 0, kScreenWidth, [[self class] cellHeightWithModel:model]);
        _avatarView.frame = CGRectMake(kSkeletonLeftMargin, kSkeletonTopMargin, kSkeletonAvatarWidth, kSkeletonAvatarWidth);
        _avatarView.layer.cornerRadius = _avatarView.frame.size.height / 2;
        _avatarView.layer.masksToBounds = YES;
        _firstLine.frame = CGRectMake(_avatarView.frame.origin.x + _avatarView.frame.size.width + 10, kSkeletonTopMargin, kScreenWidth - _avatarView.frame.origin.x - 90 * kScreenWidth / 375, 10);
        _secondLine.frame = CGRectMake(_avatarView.frame.origin.x + _avatarView.frame.size.width + 10, (_firstLine.frame.origin.y + _firstLine.frame.size.height) + 10, kScreenWidth - _avatarView.frame.origin.x - 90 * kScreenWidth / 375, 10);
        _thirdLine.frame = CGRectMake(_avatarView.frame.origin.x + _avatarView.frame.size.width + 10, (_secondLine.frame.origin.y + _secondLine.frame.size.height) + 10, kScreenWidth - _avatarView.frame.origin.x - 90 * kScreenWidth / 375, 10);
    }
}



@end
