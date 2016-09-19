//
//  GFNavigationViewController.swift
//  lovecar
//
//  Created by hjs_mac on 15/12/23.
//  Copyright © 2015年 lizhongqiang. All rights reserved.
//

import UIKit

class GFNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.toolbarHidden = true
        self.hidesBottomBarWhenPushed = true
        // Do any additional setup after loading the view.
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
