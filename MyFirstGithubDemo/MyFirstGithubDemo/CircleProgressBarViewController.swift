//
//  CircleProgressBarViewController.swift
//  MyFirstGithubDemo
//
//  Created by 李 宇亮 on 16/7/12.
//  Copyright © 2016年 hehe. All rights reserved.
//

import UIKit

class CircleProgressBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CirlceProgressBar"
        view.backgroundColor = UIColor.whiteColor()

        
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = CGRectMake(CGRectGetWidth(UIScreen.mainScreen().bounds)/2 - 50,
                                      CGRectGetHeight(UIScreen.mainScreen().bounds)/2 - 50,
                                      100,
                                      100)
        
        let path = UIBezierPath(ovalInRect: shapeLayer.bounds)
        shapeLayer.path = path.CGPath
        shapeLayer.fillColor = UIColor.clearColor().CGColor
        shapeLayer.lineWidth = 2.0
        shapeLayer.strokeColor = UIColor.redColor().CGColor
        view.layer.addSublayer(shapeLayer)
        
        let pathAnimation                 = CABasicAnimation(keyPath: "strokeEnd")//strokeStart
        pathAnimation.repeatCount         = 4
        pathAnimation.duration            = 3
        pathAnimation.timingFunction      = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        pathAnimation.fromValue           = 0
        pathAnimation.toValue             = 1
        //把fromValue 和 toValue 的值互换，同时设置keyPath为 strokeStart 变为逆时针动画
        pathAnimation.fillMode            = kCAFillModeForwards
        pathAnimation.removedOnCompletion = false
        shapeLayer.addAnimation(pathAnimation, forKey: "strokeEndAnimation")
    
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
