//
//  GFTestCollectionViewCell.swift
//  lovecar
//
//  Created by LiZhongQiang on 16/6/6.
//  Copyright © 2016年 lizhongqiang. All rights reserved.
//

import UIKit

class GFTestCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.redColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
