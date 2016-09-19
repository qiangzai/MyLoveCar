//
//  GFShowCollectionViewCell.swift
//  lovecar
//
//  Created by hjs_mac on 16/2/22.
//  Copyright © 2016年 lizhongqiang. All rights reserved.
//

import UIKit

class GFShowCollectionViewCell: UICollectionViewCell {
    var cellName = NSString()
    
    lazy var currentPageLabel: UILabel = {
        let label = UILabel()
        label.text = "0/0"
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(14)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.whiteColor()
        
        
        self.myImageView.frame = CGRectMake(10, 10, kScreenWidth - 120, kScreenWidth - 120)
        self.myLabel.frame = CGRectMake(10, kScreenWidth - 100, kScreenWidth - 120, 20)
        self.currentPageLabel.frame = CGRectMake(10, kScreenWidth - 50, kScreenWidth - 120, 20)
        
        self.contentView.backgroundColor = UIColor.whiteColor()
        self.contentView.addSubview(self.myLabel)
        self.contentView.addSubview(self.myImageView)
        self.contentView.addSubview(self.currentPageLabel)
        
        self.layer.cornerRadius = 10 
        self.layer.masksToBounds = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var myLabel: UILabel = {
        let label = UILabel()
        label.text = "测试自定义"
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(14)
        return label
    }()
    
    var myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.lightGrayColor()
        return imageView
    }()
    

    
    
    
}
