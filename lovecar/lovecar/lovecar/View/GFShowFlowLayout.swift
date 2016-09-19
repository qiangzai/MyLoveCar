//
//  GFShowFlowLayout.swift
//  lovecar
//
//  Created by hjs_mac on 16/2/22.
//  Copyright © 2016年 lizhongqiang. All rights reserved.
//

import UIKit

class GFShowFlowLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        
//        self.itemSize = CGSizeMake(100, 100)
        self.scrollDirection = .Horizontal
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    
    /*
    prepareLayout():这个方法是干嘛的?这个方法就是当你的布局快要生效的时候,你会在这个方法里计算好每个Item的position和CollectionView的size.展开一下,最简便的提升TableView的流畅度的方法是什么?很简单,别在HeightForRow的代理方法里直接计算高度.而是在网络拉取所有数据之后计算好高度,放在Array里,直接在代理方法里return heightArray[indexPath.row].那么为什么要在prepareLayout里计算每个item的Position,意图也很明显了.就是别让系统每次滚动的时候再去计算每个Cell的frame.
    */
    override func prepareLayout() {
//        super.prepareLayout()
        self.itemSize = CGSizeMake(100, 100)
        self.sectionInset = UIEdgeInsetsMake(0, (kScreenWidth - 100) / 2, 0, (kScreenWidth - 100) / 2)
        self.minimumLineSpacing = kScreenWidth - 100
        self.minimumInteritemSpacing = 500
        
    }
    
    
   
    
    //初始layout外观 返回所有的布局属性
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let array:Array = super.layoutAttributesForElementsInRect(rect)!
        
        let visRect = CGRectMake(self.collectionView!.contentOffset.x, self.collectionView!.contentOffset.y, self.collectionView!.frame.width, self.collectionView!.frame.height)
        
        let maxCenterMargin = self.collectionView!.bounds.width * 0.5 + 100 * 0.5
        
        let centerX = self.collectionView!.contentOffset.x + self.collectionView!.frame.size.width * 0.5;
        for attributes in array {
            if !CGRectIntersectsRect(visRect, attributes.frame) {
                continue
            }
            let scale = 1 + (0.8 - abs(centerX - attributes.center.x) / maxCenterMargin)
            attributes.transform = CGAffineTransformMakeScale(scale, scale)
//            attributes.alpha = 0.5
            
        }
        
        return array
    }
    
    
    
    /**
     用来设置collectionView停止滚动那一刻的位置
     
     - parameter proposedContentOffset: 原本collectionView停止滚动那一刻的位置
     - parameter velocity:              滚动速度
     
     - returns: 最终停留的位置
     */
    override func targetContentOffsetForProposedContentOffset(proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        //实现这个方法的目的是：当停止滑动，时刻有一张图片是位于屏幕最中央的。
        
        let lastRect = CGRectMake(proposedContentOffset.x, proposedContentOffset.y, self.collectionView!.frame.width, self.collectionView!.frame.height)
        //获得collectionVIew中央的X值(即显示在屏幕中央的X)
        let centerX = proposedContentOffset.x + self.collectionView!.frame.width * 0.5;
        //这个范围内所有的属性
        let array = self.layoutAttributesForElementsInRect(lastRect)
        
        //需要移动的距离
        var adjustOffsetX = CGFloat(MAXFLOAT);
        for attri in array! {
            if abs(attri.center.x - centerX) < abs(adjustOffsetX) {
                adjustOffsetX = attri.center.x - centerX;
            }
        }
        
        return CGPointMake(proposedContentOffset.x + adjustOffsetX, proposedContentOffset.y)
    }
    
    
}
