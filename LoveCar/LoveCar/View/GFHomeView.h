//
//  GFHomeView.h
//  LoveCar
//
//  Created by lizhongqiang on 16/9/20.
//  Copyright © 2016年 lizhongqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GFBaseViewController.h"

@interface GFHomeView : UIView<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, assign) GFBaseViewController *controller;
@end
