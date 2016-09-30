//
//  SearchResultController.swift
//  JSByZYF
//
//  Created by zhyunfe on 16/9/29.
//  Copyright © 2016年 zhyunfe. All rights reserved.
//

import UIKit

class SearchResultController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UISearchResultsUpdating,UITextFieldDelegate {

    @IBOutlet weak var tb: UITableView!
    var dataArr = ["1","2","3","4","5a","5","6","7","8","9","10"]
    var searchArr = NSMutableArray.init(capacity: 0)
    override func viewDidLoad() {
        super.viewDidLoad()
        tb.delegate = self
        tb.dataSource = self
        creatMyNavigationBar()
    }
    //自定制导航条
    func creatMyNavigationBar() {
        let view = UIView.init(frame: CGRectMake(0, 0, 414, 64))
        view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(view)
        let tf = UITextField(frame: CGRectMake(0,24,414,40))
        tf.placeholder = "搜索"
        tf.textAlignment = .Left
        tf.tag = 100
        let button = UIButton(type: .System)
        button.frame = CGRectMake(0, 0, 40, 40)
        button.setBackgroundImage(UIImage(named: "search"), forState: .Normal)
        tf.rightView = button
        tf.delegate = self
        tf.rightViewMode = .Always
        view.addSubview(tf)
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.init(red: 252 / 255, green: 252 / 255, blue: 252 / 255, alpha: 1).CGColor
        tf.becomeFirstResponder()

        let leftBtn = UIButton(type: .System)
        leftBtn.frame = CGRectMake(0, 0, 40, 40)
        leftBtn.setBackgroundImage(UIImage(named:"return"), forState: .Normal)
        leftBtn.addTarget(self, action: #selector(self.leftViewBtn), forControlEvents: .TouchUpInside)
        tf.leftView = leftBtn
        tf.leftViewMode = .Always
    }
    //返回按钮点击事件
    func leftViewBtn() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        print(123444)
    }
    //返回行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    //盖住没有数据的cell
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView.init()
        return view
    }
    //设置单元格内容
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("cell")
        let str = "str"
        var cell = tableView.dequeueReusableCellWithIdentifier(str)
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: str)
        }
        cell?.textLabel?.text = dataArr[indexPath.row]
        return cell!
    }

    //点击cell释放第一响应者
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let tf = self.view.viewWithTag(100) as! UITextField
        tf.resignFirstResponder()
    }
    //return按钮释放第一响应者
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let tf = self.view.viewWithTag(100) as! UITextField
        tf.resignFirstResponder()
        return true
    }

}
