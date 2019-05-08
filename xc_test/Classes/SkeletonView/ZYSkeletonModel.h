//
//  ZYSkeletonModel.h
//  tieba
//
//  Created by zuiyou on 2019/4/9.
//  Copyright © 2019年 XiaoChuan Technology Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ZYSkeletonModelType) {
    ZYSkeletonNormalCell,
    ZYSkeletonHeadView
};

@interface ZYSkeletonModel : NSObject

- (instancetype)initWithType:(ZYSkeletonModelType)type;

@property (nonatomic, assign) ZYSkeletonModelType type;


@end

NS_ASSUME_NONNULL_END
