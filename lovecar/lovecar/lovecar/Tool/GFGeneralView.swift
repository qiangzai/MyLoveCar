//
//  GFGeneralView.swift
//  lovecar
//
//  Created by LiZhongQiang on 16/1/20.
//  Copyright © 2016年 lizhongqiang. All rights reserved.
//

import UIKit

class GFGeneralView: NSObject {
    func createLabel(frameSize: CGRect, font: CGFloat, textAligment: NSTextAlignment,labelColor: UIColor)  -> UILabel {
        let lab: UILabel = UILabel(frame: frameSize)
        lab.textAlignment = textAligment
        lab.textColor = labelColor
        lab.font = UIFont.boldSystemFontOfSize(font)
        return lab
    }
    
    func createButton(frameSize: CGRect, fontSize: CGFloat, textColor: UIColor, bgColor: UIColor, btnTitle: String) -> UIButton {
        let btn: UIButton = UIButton(frame: frameSize)
        btn.setTitleColor(textColor, forState: UIControlState.Normal)
        btn.setTitle(btnTitle, forState: UIControlState.Normal)
        btn.titleLabel?.font = UIFont.boldSystemFontOfSize(fontSize)
        btn.backgroundColor = bgColor
        return btn
    }
    
    
}
