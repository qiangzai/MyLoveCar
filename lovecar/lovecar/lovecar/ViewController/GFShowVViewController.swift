//
//  GFShowVViewController.swift
//  lovecar
//
//  Created by LiZhongQiang on 16/6/14.
//  Copyright © 2016年 lizhongqiang. All rights reserved.
//

import UIKit

class GFShowVViewController: GFBaseViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    var showCollect:UICollectionView?
    let showCellIdentifier = "showCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let showLayout = UICollectionViewFlowLayout()
//        showLayout.itemSize = CGSizeMake(kScreenWidth, kScreenContent - 10)
//        showLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
//        showLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        
        let showLayout = GFShowVFlowLayout()
        
        
        self.showCollect = UICollectionView.init(frame: CGRectMake(0, 0, kScreenWidth, kScreenContent), collectionViewLayout: showLayout)
//        self.showCollect?.pagingEnabled = true
        self.showCollect?.delegate = self
        self.showCollect?.dataSource = self
        self.showCollect?.registerClass(GFShowCollectionViewCell.self, forCellWithReuseIdentifier: showCellIdentifier)
        self.view.addSubview(self.showCollect!)
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(showCellIdentifier, forIndexPath: indexPath) as! GFShowCollectionViewCell
        
        return cell
        
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
