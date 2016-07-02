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
    let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
    cell.textLabel?.text = String(format: "我是第%d行", indexPath.row)
    return cell
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

