//
//  ZYSkeletonBaseCell.h
//  tieba
//
//  Created by zuiyou on 2019/4/9.
//  Copyright © 2019年 XiaoChuan Technology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZYSkeletonModel;

NS_ASSUME_NONNULL_BEGIN

@interface ZYSkeletonBaseCell : UITableViewCell

- (void)configViewWithModel:(ZYSkeletonModel *)model;
+ (CGFloat)cellHeightWithModel:(ZYSkeletonModel *)model;

@end

NS_ASSUME_NONNULL_END
