//
//  GFShowViewController.swift
//  lovecar
//
//  Created by LiZhongQiang on 16/1/20.
//  Copyright © 2016年 lizhongqiang. All rights reserved.
//

import UIKit

let kScreenWidth = UIScreen.mainScreen().bounds.size.width
let kScreenHeight = (UIScreen.mainScreen().bounds.size.height - 64 - 49)
let kScreenContent = (UIScreen.mainScreen().bounds.size.height - 64)

class GFShowViewController: GFBaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var baseCollect:UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let showLayout = UICollectionViewFlowLayout()
//        showLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
//        showLayout.itemSize = CGSizeMake(100, 100)
//        showLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
//        showLayout.minimumLineSpacing = kScreenWidth - 100
//        showLayout.minimumInteritemSpacing = 500
        
        
        
        
        let showLayout = GFShowFlowLayout()
        
        self.baseCollect = UICollectionView(frame: CGRectMake(0, 0, kScreenWidth, kScreenContent), collectionViewLayout: showLayout)
        self.baseCollect?.delegate = self
        self.baseCollect?.dataSource = self
        self.baseCollect?.pagingEnabled = true
        self.baseCollect?.registerClass(GFTestCollectionViewCell.self, forCellWithReuseIdentifier: "testCell")
        self.view.addSubview(self.baseCollect!)
        self.baseCollect?.backgroundColor = UIColor.whiteColor()
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("testCell", forIndexPath: indexPath)
//        cell.currentLabel.text = "123"
        
        return cell
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
