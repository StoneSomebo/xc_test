//
//  ZYSkeletonModel.m
//  tieba
//
//  Created by zuiyou on 2019/4/9.
//  Copyright © 2019年 XiaoChuan Technology Co.,Ltd. All rights reserved.
//

#import "ZYSkeletonModel.h"

@implementation ZYSkeletonModel

-(instancetype)initWithType:(ZYSkeletonModelType)type {
    if (self = [super init]) {
        _type = type;
    }
    return self;
}


@end
