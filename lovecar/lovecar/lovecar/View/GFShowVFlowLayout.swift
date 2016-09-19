//
//  GFShowVFlowLayout.swift
//  lovecar
//
//  Created by LiZhongQiang on 16/6/14.
//  Copyright © 2016年 lizhongqiang. All rights reserved.
//

import UIKit

class GFShowVFlowLayout: UICollectionViewFlowLayout {
    
    var screenWidth:CGFloat?
    var screenHeight:CGFloat?
    
    override func prepareLayout() {
        super.prepareLayout()
        
        screenHeight =  collectionView?.frame.size.height
        screenWidth = collectionView?.frame.size.width
        
        scrollDirection = UICollectionViewScrollDirection.Vertical
        itemSize = CGSizeMake(screenWidth! - 100, 0.6 * screenHeight!)
        minimumLineSpacing = 30
        sectionInset = UIEdgeInsetsMake(50, 0, 100, 0)
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        // 拿到属性值
        let attributesAry = super.layoutAttributesForElementsInRect(rect)
        var newArray = [UICollectionViewLayoutAttributes]()
        for eachOldAttributes in attributesAry!{
            
            let newAttributes = eachOldAttributes.copy() as!UICollectionViewLayoutAttributes
            newArray.append(newAttributes)
        }
        
        let visableRect = CGRectMake((collectionView?.contentOffset.x)!, (collectionView?.contentOffset.y)!, screenWidth!, screenHeight!)
        let midY = CGRectGetMidY(visableRect)
        for eachNewAttributes in newArray{
            
            // navibar 的影响导致默认的位置的center值不重叠 要减去这个差值（正常view的情况下不需要减这个26.4）
            let distance =  eachNewAttributes.center.y - midY - 26.4
            
            let scale  = distance / itemSize.height
            let scaleX = 1 - 0.3 * fabs(scale)
            eachNewAttributes.transform3D = CATransform3DMakeScale(scaleX, 1.0, scaleX)
        }
        
        
        return newArray
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    
//    override func targetContentOffsetForProposedContentOffset(var proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
//        
//        let floatScale =   proposedContentOffset.y/(itemSize.height + minimumLineSpacing)
//        
//        proposedContentOffset.y = CGFloat(roundfloat(floatScale)) * CGFloat(itemSize.height + minimumLineSpacing)
//        return proposedContentOffset
//    }
    
    
    override func targetContentOffsetForProposedContentOffset(proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        let floatScale =   proposedContentOffset.y/(itemSize.height + minimumLineSpacing)
        
//        var resultPoint:CGPoint
//        CGPoint resultPoint;
        let pointY = CGFloat(roundfloat(floatScale)) * CGFloat(itemSize.height + minimumLineSpacing)
        let resultPoint = CGPointMake(proposedContentOffset.x, pointY)
        
//        proposedContentOffset.y = CGFloat(roundfloat(floatScale)) * CGFloat(itemSize.height + minimumLineSpacing)
        return resultPoint
    }
    
    
    func roundfloat(floatScale:CGFloat) ->Int{
        
        let intFloat = Int(floatScale)
        
        if(floatScale > CGFloat(intFloat) + 0.5){
            return intFloat + 1
        }else{
            return intFloat
        }
        
    }

}
