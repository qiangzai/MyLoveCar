//
//  GFShowViewController.m
//  LoveCar
//
//  Created by lizhongqiang on 16/9/20.
//  Copyright © 2016年 lizhongqiang. All rights reserved.
//

#import "GFShowViewController.h"
#import "UIView+RSAdditions.h"
#import "GFShowCollectionViewCell.h"

@interface GFShowViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *showCollectionView;
@end

@implementation GFShowViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    UICollectionView
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(self.view.width, self.view.height);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    
    self.showCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) collectionViewLayout:flowLayout];
    [self.showCollectionView registerClass:[GFShowCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.showCollectionView.pagingEnabled = YES;
    self.showCollectionView.directionalLockEnabled = YES;
    self.showCollectionView.dataSource = self;
    self.showCollectionView.delegate = self;
    self.showCollectionView.backgroundColor = [UIColor whiteColor];
    self.showCollectionView.showsHorizontalScrollIndicator = NO;
    [self.showCollectionView setContentSize:CGSizeMake(self.view.width * 10, self.view.height)];
    [self.view addSubview:self.showCollectionView];
    
}

#pragma mark - UICollectionView
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GFShowCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float offsetX = scrollView.contentOffset.x;
    int page = offsetX / self.view.width;
    
    self.navigationItem.title = [NSString stringWithFormat:@"第%i页",page];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
