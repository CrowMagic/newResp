//
//  ViewController.swift
//  MyFirstGithubDemo
//
//  Created by 李 宇亮 on 16/7/2.
//  Copyright © 2016年 hehe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView = UITableView(frame: UIScreen.mainScreen().bounds, style: .Plain)
    tableView.delegate = self
    tableView.dataSource = self
    view.addSubview(tableView)
  }
  
//  MARK: - UITableViewDelegate
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }

//  MARK: - UITableViewDataSource
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 12
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .Value1, reuseIdentifier: "cell")
    switch indexPath.row {
    case 0:
        cell.textLabel?.text = "UIAlertController"
    case 1:
        cell.textLabel?.text = "CircleProgressBar"
    case 2:
        cell.textLabel?.text = "SocialShare"
    default:
        cell.textLabel?.text = String(format: "我是小%d", indexPath.row)
    }
    return cell
  }
  
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(AlertViewController(), animated: true)
        case 1:
            navigationController?.pushViewController(CircleProgressBarViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(SocialFrameworkViewController(), animated: true)
        default:
            return
        }
    }
    
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

