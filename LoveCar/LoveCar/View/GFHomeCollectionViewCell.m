//
//  GFHomeCollectionViewCell.m
//  LoveCar
//
//  Created by lizhongqiang on 16/9/20.
//  Copyright © 2016年 lizhongqiang. All rights reserved.
//

#import "GFHomeCollectionViewCell.h"

@implementation GFHomeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 30)];
        [self.contentView addSubview:self.nameLabel];
        
        self.vLine = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width, 0, 1, self.frame.size.height)];
        self.vLine.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.vLine];
        
        self.hLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, 1)];
        self.hLine.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.hLine];
        
    }
    return self;
}

@end
