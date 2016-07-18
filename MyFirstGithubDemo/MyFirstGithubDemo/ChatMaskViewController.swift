//
//  ChatMaskViewController.swift
//  MyFirstGithubDemo
//
//  Created by 李 宇亮 on 16/7/18.
//  Copyright © 2016年 hehe. All rights reserved.
//

import UIKit

class ChatMaskViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ChatMask"
        view.backgroundColor = .whiteColor()
        
        let maskView = UIView(frame: CGRectMake(40, 100, 80, 100))
        maskView.backgroundColor = UIColor.orangeColor()
        let layer = createMaskLayerWithView(maskView)
        maskView.layer.mask = layer
        
        view.addSubview(maskView)
        
        
    }

    func createMaskLayerWithView(view: UIView) -> CAShapeLayer {
        let viewWidth = CGRectGetWidth(view.frame)
        let viewHeight = CGRectGetHeight(view.frame)
        let rightSpace: CGFloat = 10
        let topSpace : CGFloat = 15
        let point1: CGPoint = CGPointMake(0, 0)
        let point2: CGPoint = CGPointMake(viewWidth - rightSpace, 0)
        let point3: CGPoint = CGPointMake(viewWidth - rightSpace, topSpace)
        let point4: CGPoint = CGPointMake(viewWidth, topSpace)
        let point5: CGPoint = CGPointMake(viewWidth - rightSpace, topSpace + 10)
        let point6: CGPoint = CGPointMake(viewWidth - rightSpace, viewHeight)
        let point7: CGPoint = CGPointMake(0, viewHeight)
        let pointArray = [point2, point3, point4, point5, point6, point7]
        
        let path = UIBezierPath()
        path.moveToPoint(point1)
        for point in pointArray {
            path.addLineToPoint(point)
        }
        path.closePath()
        
        let layer = CAShapeLayer()
        layer.path = path.CGPath
        
        return layer
        
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