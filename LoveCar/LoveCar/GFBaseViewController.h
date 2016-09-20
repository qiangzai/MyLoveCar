//
//  GFBaseViewController.h
//  LoveCar
//
//  Created by lizhongqiang on 16/9/20.
//  Copyright © 2016年 lizhongqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GFBaseViewController : UIViewController


- (void)push:(UIViewController *)controller anim:(BOOL)anim;

- (void)pop:(BOOL)anim;

- (void)popToRoot:(BOOL)anim;


@end
