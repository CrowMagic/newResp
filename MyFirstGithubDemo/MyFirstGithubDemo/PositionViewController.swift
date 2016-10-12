//
//  PositionViewController.swift
//  MyFirstGithubDemo
//
//  Created by 李 宇亮 on 16/10/12.
//  Copyright © 2016年 hehe. All rights reserved.
//

import UIKit

class PositionViewController: UIViewController {
    var yellowView: UIView!
    var redView: UIView!
    var purpleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .whiteColor()
        setupViews()
        
      
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(0.8, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: .CurveEaseInOut, animations: {
            self.yellowView.center.x = self.view.bounds.width - self.yellowView.center.x
            self.yellowView.center.y += 200
            
            self.redView.center.x = self.view.bounds.width - self.redView.center.x
            self.redView.center.y += 200
           
        }) {(fuck) in
            UIView.animateWithDuration(1, animations: { 
                self.yellowView.backgroundColor = .redColor()
                self.redView.backgroundColor = .yellowColor()
            })
          
        }
        
        UIView.animateWithDuration(0.6, delay: 0.4, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: .CurveEaseInOut, animations: { 
            self.purpleView.bounds = CGRectMake(0, 0, 150, 150)
            self.purpleView.center.y -= 150
        }) {(fuck) in
            UIView.animateWithDuration(1, delay: 1, options: [], animations: {
                self.purpleView.transform = CGAffineTransformMakeScale(0.8, 0.8)
                }, completion: nil)
            self.rotate()
            self.opacity()
        }
    }
    
    func rotate() {
        UIView.animateWithDuration(1, delay: 1, options: [], animations: {
            
            self.purpleView.transform = CGAffineTransformRotate(self.purpleView.transform, CGFloat(M_PI))
            }, completion: { (fuck) in
                self.rotate()
    
        })
    }
    func opacity() {
        UIView.animateWithDuration(1, animations: { 
            self.purpleView.alpha = 0
            }) { (fuck) in
                UIView.animateWithDuration(1, animations: { 
                    self.purpleView.alpha = 1
                    }, completion: { (fuck) in
                        self.opacity()
                })
        }
    }
    
    
    func setupViews() {
        yellowView = UIView(frame: CGRectMake(50, 100, 100, 100))
        yellowView.backgroundColor = .yellowColor()
        view.addSubview(yellowView)
        redView = UIView(frame: CGRectMake(250, 100, 100, 100))
        redView.backgroundColor = .redColor()
        view.addSubview(redView)
        purpleView = UIView(frame: CGRectMake(150, 300, 100, 100))
        purpleView.backgroundColor = .purpleColor()
        view.addSubview(purpleView)
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
