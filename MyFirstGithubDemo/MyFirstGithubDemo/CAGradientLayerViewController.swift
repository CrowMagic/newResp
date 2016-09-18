//
//  CAGradientLayerViewController.swift
//  MyFirstGithubDemo
//
//  Created by 李 宇亮 on 16/9/18.
//  Copyright © 2016年 hehe. All rights reserved.
//

import UIKit

class CAGradientLayerViewController: UIViewController {
    var gradientLayer: CAGradientLayer!
    var colorSets = [[CGColor]]()
    var currentColorSet: Int!
    var panDirection: PanDirections!
    override func viewDidLoad() {
        super.viewDidLoad()

        createColorSets()
        
        setupGradientLayer()
        //单点切换颜色组
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTypeGestureRecognier))
        view.addGestureRecognizer(tapGestureRecognizer)
        //两点改变一个颜色组的颜色比例
        let twoFingerTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(twotwo))
        twoFingerTapGestureRecognizer.numberOfTouchesRequired = 2
        view.addGestureRecognizer(twoFingerTapGestureRecognizer)
        
        //根据滑动的方向改变渐变方向
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        view.addGestureRecognizer(panGestureRecognizer)
        
        
    }
    
    func handlePan(pan: UIPanGestureRecognizer) {
        let velocity = pan.velocityInView(self.view)
        if pan.state == UIGestureRecognizerState.Changed {
            if velocity.x > 300.0 {
                // 水平向右的情况
                // 之后检测竖直方向上的速度
                
                if velocity.y > 300.0 {
                    // 从左上到右下
                    panDirection = PanDirections.topLeftToBottomRight
                }
                else if velocity.y < -300.0 {
                    // 从左下到右上
                    panDirection = PanDirections.bottomLeftToTopRight
                }
                else {
                    // 水平向右
                    panDirection = PanDirections.right
                }
            }
            else if velocity.x < -300.0 {
                // 水平方向想左的情况
                // 之后检测数值方向上的速度
                
                if velocity.y > 300.0 {
                    // 从右上到左下
                    panDirection = PanDirections.topRightToBottomLeft
                }
                else if velocity.y < -300.0 {
                    // 从右下到左上
                    panDirection = PanDirections.bottomRightToTopLeft
                }
                else {
                    // 水平向左
                    panDirection = PanDirections.left
                }
            }
            else {
                // 只有竖直方向上的状态（向上或向下）
                
                if velocity.y > 300.0 {
                    // 竖直向下
                    panDirection = PanDirections.bottom
                }
                else if velocity.y < -300.0 {
                    // 竖直向上
                    panDirection = PanDirections.top
                }
                else {
                    // 无手势
                    panDirection = nil
                }
            }
        }
        else if pan.state == UIGestureRecognizerState.Ended {
            changeGradientDirection()
        }
    }
    func changeGradientDirection() {
        if panDirection != nil {
            switch panDirection.rawValue {
            case PanDirections.right.rawValue:
                gradientLayer.startPoint = CGPointMake(0.0, 0.5)
                gradientLayer.endPoint = CGPointMake(1.0, 0.5)
                
            case PanDirections.left.rawValue:
                gradientLayer.startPoint = CGPointMake(1.0, 0.5)
                gradientLayer.endPoint = CGPointMake(0.0, 0.5)
                
            case PanDirections.bottom.rawValue:
                gradientLayer.startPoint = CGPointMake(0.5, 0.0)
                gradientLayer.endPoint = CGPointMake(0.5, 1.0)
                
            case PanDirections.top.rawValue:
                gradientLayer.startPoint = CGPointMake(0.5, 1.0)
                gradientLayer.endPoint = CGPointMake(0.5, 0.0)
                
            case PanDirections.topLeftToBottomRight.rawValue:
                gradientLayer.startPoint = CGPointMake(0.0, 0.0)
                gradientLayer.endPoint = CGPointMake(1.0, 1.0)
                
            case PanDirections.topRightToBottomLeft.rawValue:
                gradientLayer.startPoint = CGPointMake(1.0, 0.0)
                gradientLayer.endPoint = CGPointMake(0.0, 1.0)
                
            case PanDirections.bottomLeftToTopRight.rawValue:
                gradientLayer.startPoint = CGPointMake(0.0, 1.0)
                gradientLayer.endPoint = CGPointMake(1.0, 0.0)
                
            default:
                gradientLayer.startPoint = CGPointMake(1.0, 1.0)
                gradientLayer.endPoint = CGPointMake(0.0, 0.0)
            }
        }
    }
    
    enum PanDirections: Int {
        case right
        case left
        case bottom
        case top
        case topLeftToBottomRight
        case topRightToBottomLeft
        case bottomLeftToTopRight
        case bottomRightToTopLeft
    }
    
    func twotwo() {
        let secondColorLocation = arc4random_uniform(100)
        let firstColorLocation = arc4random_uniform(99)
        gradientLayer.locations = [NSNumber(double: Double(firstColorLocation)/100.0), NSNumber(double: Double(secondColorLocation)/100.0)]
        print(secondColorLocation, firstColorLocation)
        print(gradientLayer.locations)
        
        
    }
    
    func handleTypeGestureRecognier() {
        if currentColorSet < colorSets.count - 1 {
            currentColorSet! += 1
        } else {
            currentColorSet = 0
        }
        let colorChangeAnimation = CABasicAnimation(keyPath: "colors")
        //设置代理和覆写animationDidStop方法，可以防止闪的问题
        colorChangeAnimation.delegate = self
        colorChangeAnimation.duration = 2.0
        colorChangeAnimation.toValue = colorSets[currentColorSet]
        colorChangeAnimation.fillMode = kCAFillModeForwards
        colorChangeAnimation.removedOnCompletion = false
        gradientLayer.addAnimation(colorChangeAnimation, forKey: "colorChange")
        
    }
    
    func setupGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.frame
        gradientLayer.colors = colorSets[currentColorSet]
        gradientLayer.locations = [0.2, 0.8]
        gradientLayer.startPoint = CGPointMake(0.0, 0.5)
        gradientLayer.endPoint = CGPointMake(1.0, 0.5)
        view.layer.addSublayer(gradientLayer)
    }
    
    func createColorSets() {
        colorSets.append([UIColor.redColor().CGColor, UIColor.yellowColor().CGColor])
        colorSets.append([UIColor.greenColor().CGColor, UIColor.magentaColor().CGColor])
        colorSets.append([UIColor.grayColor().CGColor, UIColor.lightGrayColor().CGColor])
        currentColorSet = 0
    }

    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        if flag {
            gradientLayer.colors = colorSets[currentColorSet]
        }
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
