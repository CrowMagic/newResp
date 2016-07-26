//
//  HandleTableViewViewController.swift
//  MyFirstGithubDemo
//
//  Created by 李 宇亮 on 16/7/26.
//  Copyright © 2016年 hehe. All rights reserved.
//

import UIKit

class HandleTableViewViewController: UIViewController {
    var tableview111: UITableView!
    var sectionArray: [[String]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HandleTableView"
        view.backgroundColor = UIColor.whiteColor()
        
        configTableView()
        let array1 = ["怜", "蛾", "不", "点", "灯"]
        let array2 = ["空", "持", "百", "千", "偈"]
        let array3 = ["不", "如", "吃", "茶", "去"]
        
        sectionArray = [array1, array2, array3]
        
    }
    
    func configTableView() {
        tableview111 = UITableView(frame: UIScreen.mainScreen().bounds, style: .Grouped)
        tableview111.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableview111.delegate = self
        tableview111.dataSource = self
        tableview111.sectionHeaderHeight = 0
        tableview111.sectionFooterHeight = 50
        view.addSubview(tableview111)
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

extension HandleTableViewViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionArray.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("我刷新了",sectionArray[0])
        return sectionArray[section].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = sectionArray[indexPath.section][indexPath.row]
        cell.selectionStyle = .None
        return cell
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let button = UIButton(type: .Custom)
        button.setTitle("点我删除", forState: .Normal)
        button.backgroundColor = UIColor.redColor()
        button.tag = section
        button.addTarget(self, action: #selector(clickToDeleteSection(_:)), forControlEvents: .TouchUpInside)
        return button
    }
    /**
     按照每个区删除表
     
     - parameter sender: 区尾视图上的按钮
     */
    func clickToDeleteSection(sender: UIButton) {
        let indexSet = NSIndexSet(index: sender.tag)
        sectionArray.removeAtIndex(sender.tag)
        tableview111.deleteSections(indexSet, withRowAnimation: .Automatic)
        //动画的执行达到了删除的效果，但也要手动再刷新表，使sender.tag 和数组的索引保持同步。别特么想当然，不要再说我以为。
        tableview111.reloadData()
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //重载这个方法，默认单元格左划右边显示为delete
        
    }
    /**
     按照每一行来删除
     
     - parameter tableView: 表
     - parameter indexPath: cell的索引
     
     - returns: 每行所要执行的动作
     */
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
//        if indexPath.section == 1 {
            let rowActionDelete = UITableViewRowAction(style: .Default, title: "删除", handler: { (rowAction, indexpath) in
                /*
                //此处只是一个局部变量来获取到某个区的数组，并且也顺利执行了removeAtIndex,但此处是一个闭包，并没有对 self.sectionArray[indexPath.section]做修改，所以尽管刷新了还是无效
                以第0区第四行为例操作输出如下
                                    indexPath.section 0
                                        indexPath.row 4
                 self.sectionArray[indexPath.section] ["怜", "蛾", "不", "点", "灯"]
                                             rowArray ["怜", "蛾", "不", "点"]
 
                var rowArray = self.sectionArray[indexPath.section]
                rowArray.removeAtIndex(indexPath.row)
                */
                
                self.sectionArray[indexPath.section].removeAtIndex(indexPath.row)
                if self.sectionArray[indexPath.section].count == 0 {
                    self.sectionArray.removeAtIndex(indexPath.section)
                }

//                print(indexPath.section, indexpath.row,  self.sectionArray[indexPath.section], rowArray)
                self.tableview111.reloadData()

            })
            
            let rowActionEdit = UITableViewRowAction(style: .Normal, title: "编辑", handler: { (rowAction, indePath) in
                
            })
            rowActionEdit.backgroundColor = UIColor(red: 0, green: 124/255.0, blue: 1, alpha: 1)
            return [rowActionDelete, rowActionEdit]
            
//        }
//        
//        return nil
    }
    
}



