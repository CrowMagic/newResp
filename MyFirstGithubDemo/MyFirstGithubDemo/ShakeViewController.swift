//
//  ShakeViewController.swift
//  MyFirstGithubDemo
//
//  Created by 李 宇亮 on 16/7/25.
//  Copyright © 2016年 hehe. All rights reserved.
//

import UIKit

class ShakeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ShakeWithProtocol"
        view.backgroundColor = .whiteColor()
        /// 可以自定义Button类遵从viewShake协议(主要练习协议这个范式，从逻辑上更清晰，谁要获得抖动的效果谁就去遵守抖动的协议，比直接写一个扩展丢到一堆更清晰)
        let button = ShakeButton(type: .Custom)
        button.center = view.center
        button.bounds = CGRectMake(0, 0, 100, 100)
        button.layer.cornerRadius = 50
        button.setTitle("shake", forState: .Normal)
        button.backgroundColor = .cyanColor()
        button.setTitleColor(.whiteColor(), forState: .Normal)
        button.addTarget(self, action: #selector(shakeClick(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(button)
    }

    func shakeClick(sender: ShakeButton) {
        sender.shake()
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

protocol ViewShake {

}

extension ViewShake where Self: UIView {
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.fromValue = NSValue(CGPoint: CGPointMake(self.center.x - 4.0, self.center.y))
        animation.toValue = NSValue(CGPoint: CGPointMake(self.center.x + 4.0, self.center.y))
        layer.addAnimation(animation, forKey: "position")
    }
}

class ShakeButton: UIButton, ViewShake {

}

