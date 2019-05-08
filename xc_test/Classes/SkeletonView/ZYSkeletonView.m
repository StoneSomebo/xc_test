//
//  ZYSkeletonView.m
//  tieba
//
//  Created by zuiyou on 2019/4/9.
//  Copyright © 2019年 XiaoChuan Technology Co.,Ltd. All rights reserved.
//

#import "ZYSkeletonView.h"
#import "ZYSkeletonBaseCell.h"
#import "ZYSkeletonModel.h"

#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ZYSkeletonView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataSource;
@property (nonatomic,assign) ZYSkeletonViewType type;

@end


@implementation ZYSkeletonView


-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _type = ZYSkeletonViewLists;
        [self configData];
        [self setupSubviews];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame type:(ZYSkeletonViewType)type {
    if (self = [super initWithFrame:frame]) {
        _type = type;
        [self configData];
        [self setupSubviews];
    }
    return self;
}

- (void)configData {
    
    NSMutableArray *muDataSource = [NSMutableArray array];
    CGFloat height = 0;
    if (self.type == ZYSkeletonViewHeadAndLists) {
        ZYSkeletonModel *model = [[ZYSkeletonModel alloc] initWithType:ZYSkeletonHeadView];
        [muDataSource addObject:model];
        height += [ZYSkeletonBaseCell cellHeightWithModel:model];
    }
    while (height < kScreenHeight) {
        ZYSkeletonModel *model = [[ZYSkeletonModel alloc] initWithType:ZYSkeletonNormalCell];
        [muDataSource addObject:model];
        height += [ZYSkeletonBaseCell cellHeightWithModel:model];
    }
    self.dataSource = muDataSource.copy;
}

- (void)setupSubviews {
    
    self.backgroundColor = [UIColor whiteColor];

    self.tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    [self.tableView registerClass:[ZYSkeletonBaseCell class] forCellReuseIdentifier:NSStringFromClass([ZYSkeletonBaseCell class])];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = NO;
    [self addSubview:self.tableView];
    
}


#pragma mark UITableViewDelegate,UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZYSkeletonBaseCell *baseCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZYSkeletonBaseCell class]) forIndexPath:indexPath];
    ZYSkeletonModel *model = self.dataSource[indexPath.row];
    [baseCell configViewWithModel:model];
    return baseCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZYSkeletonModel *model = self.dataSource[indexPath.row];
    return [ZYSkeletonBaseCell cellHeightWithModel:model];
}



@end
