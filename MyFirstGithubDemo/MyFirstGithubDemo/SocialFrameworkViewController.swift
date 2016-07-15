
//
//  SocialFrameworkViewController.swift
//  MyFirstGithubDemo
//
//  Created by 李 宇亮 on 16/7/15.
//  Copyright © 2016年 hehe. All rights reserved.
//

import UIKit
import Social  //本类需要导入Social.Framework,使用系统提供的分享功能

class SocialFrameworkViewController: UIViewController {

    var textView: UITextView!
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        title = "share"
        view.backgroundColor = UIColor.whiteColor()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(shareToOhers))
        
        configTextView()
    }
    
    func shareToOhers() {
        configActionSheet()
    }
    /**
     配置textView
     */
    func configTextView() {
        textView = UITextView(frame: CGRectMake(0, 0, 100, 10))
        view.addSubview(textView)
        textView.layer.cornerRadius = 10
        textView.layer.borderColor = UIColor.redColor().CGColor
        textView.layer.borderWidth = 3
        textView.text = "Please input what the fuck you want to share.👿"
        textView.attributedText = NSAttributedString(string: "Please input what the fuck you want to share.👿",
                                                 attributes: [NSFontAttributeName: UIFont.systemFontOfSize(20), NSForegroundColorAttributeName: UIColor.cyanColor()])
    
        textView.translatesAutoresizingMaskIntoConstraints = false
        var layoutConstraints = [NSLayoutConstraint]()
        layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[subView]-20-|",
                                                                            options: [],
                                                                            metrics: nil,
                                                                            views: ["subView": textView])
        layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|-84-[subView]-200-|",
                                                                            options: [],
                                                                            metrics: nil,
                                                                            views: ["subView": textView])
        NSLayoutConstraint.activateConstraints(layoutConstraints)
        
        
    }
    /**
     配置actionSheet
     */
    func configActionSheet() {
        let actionSheet = UIAlertController(title: "Action Sheet", message: "Just For Practise", preferredStyle: .ActionSheet)
        let actionSina = UIAlertAction(title: "Share To Sina", style: .Default) { (action) in
            self.sharedContent(SLServiceTypeSinaWeibo, setType: "新浪微博")
        }
        let actionTencent = UIAlertAction(title: "Share To Tencent", style: .Default) { (action) in
            self.sharedContent(SLServiceTypeTencentWeibo, setType: "腾讯微博")
        }
        let actionMore = UIAlertAction(title: "More", style: .Default) { (action) in
            self.configActivity()
        }
        let actionCancel = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            
        }
        
        actionSheet.addAction(actionSina)
        actionSheet.addAction(actionTencent)
        actionSheet.addAction(actionMore)
        actionSheet.addAction(actionCancel)
        
        presentViewController(actionSheet, animated: true) { 
            
        }
    }
    /**
     配置avtivityViewController
     */
    func configActivity() {
        let  activityViewController = UIActivityViewController(activityItems: [textView.text], applicationActivities: nil)
        //所添加的内容为你不想要显示的内容
        activityViewController.excludedActivityTypes = [UIActivityTypeMail]
        presentViewController(activityViewController, animated: true, completion: nil)
        
    }
    /**
     分享的内容
     
     - parameter serviceType: social.framework 中所支持的类型
     - parameter setType:     填写对应的类型信息，便于提示时使用
     */
    func sharedContent(serviceType: String, setType: String) {
        if SLComposeViewController.isAvailableForServiceType(serviceType) {
            let composeVC = SLComposeViewController(forServiceType: serviceType)
            //限制输入140个字符，超过的自动截取前140个
            if textView.text.characters.count <= 140 {
                composeVC.setInitialText("\(textView.text)")
            } else {
                let subText = textView.text.substringToIndex(textView.text.startIndex.advancedBy(140))
                composeVC.setInitialText("\(subText)")
            }
            presentViewController(composeVC, animated: true, completion: nil)
            
        } else {
            showAlertMessage("请转到设置里面登录\(setType)")
        }

    }
    /**
     配置alertMessage
     
     - parameter message: 提示信息
     */
    func showAlertMessage(message: String) {
        let alertMessage  = UIAlertController(title: "报告大王", message: message, preferredStyle: .Alert)
        let actionCancel  = UIAlertAction(title: "任性不去", style: .Default, handler: nil)
        let actionSetting = UIAlertAction(title: "马上登录", style: .Default) { (action) in
            UIApplication.sharedApplication().openURL(NSURL(string: UIApplicationOpenSettingsURLString)!)
        }
        
        alertMessage.addAction(actionCancel)
        alertMessage.addAction(actionSetting)
        presentViewController(alertMessage, animated: true) { 
            
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
