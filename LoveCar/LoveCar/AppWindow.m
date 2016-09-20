//
//  AppWindow.m
//  LoveCar
//
//  Created by lizhongqiang on 16/9/20.
//  Copyright © 2016年 lizhongqiang. All rights reserved.
//

#import "AppWindow.h"
#import "GFRootViewController.h"

@implementation AppWindow

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        GFRootViewController *rootVC = [[GFRootViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:rootVC];
        self.rootViewController = nav;
        
    }
    return self;
}



@end
