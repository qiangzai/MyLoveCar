//
//  GFRootViewController.swift
//  lovecar
//
//  Created by hjs_mac on 15/12/23.
//  Copyright © 2015年 lizhongqiang. All rights reserved.
//

import UIKit

class GFRootViewController: UIViewController, UIDynamicAnimatorDelegate, UICollisionBehaviorDelegate {
    var animator:UIDynamicAnimator?
    var collisionBehavior:UICollisionBehavior!
    
//    var button:UIButton?
    var button1:UIButton?
    var button2:UIButton?
    var button3:UIButton?
    var button4:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "爱车一族";
        
        
        self.button1 = GFGeneralView().createButton(CGRectMake(-100, 160, 100, 40), fontSize: 12, textColor: UIColor.redColor(), bgColor: UIColor.purpleColor(), btnTitle: "随机浏览5个")
        self.button1?.tag = 101
        self.button1?.addTarget(self, action: #selector(GFRootViewController.button1Click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(self.button1!)
        
        self.button2 = GFGeneralView().createButton(CGRectMake(-110, 220, 100, 40), fontSize: 12, textColor: UIColor.redColor(), bgColor: UIColor.purpleColor(), btnTitle: "按顺序浏览")
        self.button2?.tag = 102
        self.button2?.addTarget(self, action: #selector(GFRootViewController.button1Click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(self.button2!)
        
        self.button3 = GFGeneralView().createButton(CGRectMake(-120, 280, 100, 40), fontSize: 12, textColor: UIColor.redColor(), bgColor: UIColor.purpleColor(), btnTitle: "按首字母浏览")
        self.button3?.addTarget(self, action: #selector(GFRootViewController.button1Click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.button3?.tag = 103
        self.view.addSubview(self.button3!)
        
        self.button4 = GFGeneralView().createButton(CGRectMake(-130, 340, 100, 40), fontSize: 12, textColor: UIColor.redColor(), bgColor: UIColor.purpleColor(), btnTitle: "搜索")
        self.button4?.addTarget(self, action: #selector(GFRootViewController.button1Click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(self.button4!)
        
        UIView.animateWithDuration(1) { () -> Void in
            self.button1?.center = CGPointMake(self.view.frame.width / 2, (self.button1?.frame.origin.y)!)
        }
        
        UIView.animateWithDuration(1.5) { () -> Void in
            self.button2?.center = CGPointMake(self.view.frame.width / 2, (self.button2?.frame.origin.y)!)
        }
        
        UIView.animateWithDuration(2) { () -> Void in
            self.button3?.center = CGPointMake(self.view.frame.width / 2, (self.button3?.frame.origin.y)!)
        }
        
        UIView.animateWithDuration(2.5) { () -> Void in
            self.button4?.center = CGPointMake(self.view.frame.width / 2, (self.button4?.frame.origin.y)!)
        }
        
//        button = UIButton(frame: CGRectMake(-200, 200, 100, 40))
//        button?.setTitle("测试按钮", forState: UIControlState.Normal)
//        button?.backgroundColor = UIColor.blueColor()
//        button?.addTarget(self, action: "buttonClick:", forControlEvents: UIControlEvents.TouchUpInside)
//        self.view.addSubview(button!)
//        
//        UIView.animateWithDuration(1, animations: { () -> Void in
//            self.button?.center = self.view.center;
//            }) { (isFinish) -> Void in
//                self.button?.center = self.view.center;
//        }
        
        
//        animator = UIDynamicAnimator(referenceView: self.view)
////        let gravityBehavior = UIGravityBehavior.init(items: [button!])
////        gravityBehavior.magnitude = 0.3
////        gravityBehavior.gravityDirection = CGVectorMake(0.9, 0.0)
//        
//        let test = UIGravityBehavior(items: [button!])
//        
//        collisionBehavior = UICollisionBehavior.init(items: [button!])
//        collisionBehavior!.translatesReferenceBoundsIntoBoundary = true
//        collisionBehavior!.collisionDelegate = self
////        collisionBehavior.action = {
////            NSStringFromCGPoint(self.view.center)
////        }
////        collisionBehavior!.addBoundaryWithIdentifier("button", fromPoint: CGPointMake(self.view.frame.origin.x, 150), toPoint: CGPointMake(self.view.frame.origin.x + self.view.frame.width, 350))
//        collisionBehavior!.addBoundaryWithIdentifier("button", fromPoint: CGPointMake(self.view.frame.origin.x, 150), toPoint: CGPointMake(200, 350))
//        
//        animator?.addBehavior(test)
//        animator?.addBehavior(collisionBehavior!)
        
        
        
    }
    
    
    func button1Click(sender :UIButton){
        let button = sender
        let buttonTag = button.tag
//        if buttonTag == 101 {
//            let showVC:GFShowViewController = GFShowViewController()
//            self.navigationController?.pushViewController(showVC, animated: true)
//        }else if buttonTag == 102{
//            let showVC = GFShowNormalViewController()
//            self.navigationController?.pushViewController(showVC, animated: true)
//            
//        }
        
        if buttonTag == 101 {
            let showVC = GFShowVViewController()
            self.navigationController?.toolbarHidden = true
            self.navigationController?.pushViewController(showVC, animated: true)
        }else if buttonTag == 102{
            let showVC = GFShowHViewController()
            self.navigationController?.toolbarHidden = true
            self.navigationController?.pushViewController(showVC, animated: true)
        }else if buttonTag == 103{
            let bQuery: BmobQuery = BmobQuery(className: "car")
            bQuery.findObjectsInBackgroundWithBlock({ array, error in
                print(array)
                for obj in array{
                    if obj is BmobObject{
                        let bmobObj: BmobObject = obj as! BmobObject
                        print(bmobObj)
                        
                    }
                }
                
            })
        }
    }
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
