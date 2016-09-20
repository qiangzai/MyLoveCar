//
//  GFBaseViewController.m
//  LoveCar
//
//  Created by lizhongqiang on 16/9/20.
//  Copyright © 2016年 lizhongqiang. All rights reserved.
//

#import "GFBaseViewController.h"

@interface GFBaseViewController ()

@end

@implementation GFBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}


- (void)push:(UIViewController *)controller anim:(BOOL)anim
{
    [self.navigationController pushViewController:controller animated:anim];
}

- (void)pop:(BOOL)anim
{
    [self.navigationController popViewControllerAnimated:anim];
}

- (void)popToRoot:(BOOL)anim
{
    [self.navigationController popToRootViewControllerAnimated:anim];
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
