//
//  StackViewController.swift
//  MyFirstGithubDemo
//
//  Created by 李 宇亮 on 16/7/16.
//  Copyright © 2016年 hehe. All rights reserved.
//

import UIKit

class StackViewController: UIViewController {
    var bigStackView: UIStackView!
    var smallStackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UIStackView"
        view.backgroundColor = .whiteColor()
        configStackView()

    }
    
    func configStackView() {
        bigStackView = UIStackView()
        view.addSubview(bigStackView)
        bigStackView.translatesAutoresizingMaskIntoConstraints = false
        //Main UIStackView constraints, nearly fills its parent view
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-94-[bigStackView]-30-|", options: .AlignAllLeading, metrics: nil, views: ["bigStackView": bigStackView]))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-30-[bigStackView]-30-|", options: .AlignAllLeading, metrics: nil, views: ["bigStackView": bigStackView]))
        bigStackView.axis = .Vertical
        bigStackView.alignment = .Fill
        bigStackView.spacing = 25
        bigStackView.distribution = .FillEqually
        
        let label1 = UILabel()
        label1.text = "I am a red label"
        label1.textAlignment = .Center
        label1.backgroundColor = .redColor()
//        label1.layer.cornerRadius = 30
        bigStackView.addArrangedSubview(label1)
        
        let label2 = UILabel()
        label2.text = "I am a green label"
        label2.textAlignment = .Center
        label2.backgroundColor = .greenColor()
//        label2.layer.cornerRadius = 30
        bigStackView.addArrangedSubview(label2)
        
        smallStackView = UIStackView()
        smallStackView.axis = .Horizontal
        smallStackView.alignment = .Fill
        smallStackView.spacing = 25
        smallStackView.distribution = .FillEqually
        smallStackView.addArrangedSubview(UIButton(type: .InfoDark))
        smallStackView.addArrangedSubview(UIButton(type: .InfoLight))
        smallStackView.addArrangedSubview(UIButton(type: .ContactAdd))
        
        bigStackView.addArrangedSubview(smallStackView)
        
        let customButton = UIButton(type: .Custom)
        customButton.backgroundColor = UIColor.brownColor()
        customButton.layer.cornerRadius = 30
        customButton.setTitle("Click me", forState: .Normal)
        customButton.setTitleColor(.cyanColor(), forState: .Normal)
        customButton.addTarget(self, action: #selector(buttonClick(_:)), forControlEvents: .TouchUpInside)
        bigStackView.addArrangedSubview(customButton)
        
    }
    
    func buttonClick(sender: UIButton) {
        UIView.animateWithDuration(0.5) { 
            self.smallStackView.hidden = !self.smallStackView.hidden
        }
        /*
        UIView.animateWithDuration(0.5, animations: { 
            self.smallStackView.hidden = !self.smallStackView.hidden
            }) { (true) in
                /**
                 这个移除操作需要两步，第一步调用removeArrangedSubview方法来从UIStackView删除视图并且重新布局剩余的subviews但是实际上并没有从父视图上移除。第二部分就是调用removeFromSuperview方法以保证该视图从父视图中完全的被移除
                 */
                self.bigStackView.removeArrangedSubview(self.smallStackView)
                self.smallStackView.removeFromSuperview()
        }
        */
        
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














