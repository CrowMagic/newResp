//
//  AlertViewController.swift
//  MyFirstGithubDemo
//
//  Created by 李 宇亮 on 16/7/12.
//  Copyright © 2016年 hehe. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    var loginButton: UIButton!
    var alertVC: UIAlertController!
    var usernameLabel: UILabel!
    var passwordLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UIAlertController"
        view.backgroundColor = UIColor.whiteColor()
        
        loginButton = UIButton(type: .System)
        loginButton.center = view.center
        loginButton.bounds = CGRectMake(0, 0, 100, 100)
        loginButton.setTitle("Login", forState: .Normal)
//        loginButton.titleLabel?.text = "Login"
//        loginButton.titleLabel?.textColor = UIColor.redColor()
        loginButton.layer.cornerRadius = 50
        loginButton.backgroundColor = UIColor.yellowColor()
        loginButton.addTarget(self, action: #selector(self.loginClick), forControlEvents: .TouchUpInside)
        view.addSubview(loginButton)
        
        usernameLabel = UILabel(frame: CGRectMake(100, 100, 100, 50))
        usernameLabel.text = "用户名:"
        view.addSubview(usernameLabel)
        
        passwordLabel = UILabel(frame: CGRectMake(100, 150, 100, 50))
        passwordLabel.text = "密码:"
        view.addSubview(passwordLabel)
        
        
        
        
        alertVC = UIAlertController(title: "Hello", message: "Swift", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Login", style: .Default) { (action) in
//            if let username = self.alertVC.textFields?.first?.text {
//                print("username = \(username)")
//                self.usernameLabel.text = self.usernameLabel.text! + username
//            }
//            if let password = self.alertVC.textFields?.last?.text {
//                print("password = \(password)")
//                self.passwordLabel.text = self.passwordLabel.text! + password
//            }
            guard let username = self.alertVC.textFields?.first?.text else {
                print("username is empty")
                return
            }
            guard let password = self.alertVC.textFields?.last?.text else {
                print("password is empty")
                return
            }
            self.usernameLabel.text = self.usernameLabel.text! + username
            self.passwordLabel.text = self.passwordLabel.text! + password
        }
        alertVC.addAction(action)
        alertVC.addTextFieldWithConfigurationHandler { (username) in
            username.placeholder = "Please input your name."
        }
        alertVC.addTextFieldWithConfigurationHandler { (password) in
            password.placeholder = "Please input your password"
        }
        
    }

    func loginClick() {
        presentViewController(alertVC, animated: true, completion: nil)
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
