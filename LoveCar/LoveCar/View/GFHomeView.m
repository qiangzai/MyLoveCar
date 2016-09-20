//
//  GFHomeView.m
//  LoveCar
//
//  Created by lizhongqiang on 16/9/20.
//  Copyright © 2016年 lizhongqiang. All rights reserved.
//  1.每日随机 collection展示  2.按顺序  3.搜索
//

#import "GFHomeView.h"
#import "GFHomeCollectionViewCell.h"
#import "GFShowViewController.h"
#import "GFListViewController.h"
#import "GFSearchViewController.h"

@implementation GFHomeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initContent];
    }
    return self;
}

- (void)initContent
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(self.frame.size.width / 2, self.frame.size.width / 2);
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    
    UICollectionView *collect = [[UICollectionView alloc] initWithFrame:self.frame collectionViewLayout:flowLayout];
    collect.backgroundColor = [UIColor whiteColor];
    collect.dataSource = self;
    collect.delegate = self;
    [collect registerClass:[GFHomeCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self addSubview:collect];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GFHomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.nameLabel.text = @"123qwe";
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"item = %@ row = %ld",indexPath.item,indexPath.row);
    if (indexPath.row == 0) {
        GFShowViewController *showVC = [[GFShowViewController alloc] init];
        [self.controller push:showVC anim:YES];
    }else if (indexPath.row == 1){
        GFListViewController *listVC = [[GFListViewController alloc] init];
        [self.controller push:listVC anim:YES];
    }else if (indexPath.row == 2){
        GFSearchViewController *searchVC = [[GFSearchViewController alloc] init];
        [self.controller push:searchVC anim:YES];
    }
    
}

@end
