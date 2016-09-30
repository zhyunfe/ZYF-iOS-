//
//  ZYF-Main-MyView.swift
//  JSByZYF
//
//  Created by zhyunfe on 16/9/23.
//  Copyright © 2016年 zhyunfe. All rights reserved.
//

import UIKit

class ZYF_Main_MyView:  UIViewController,UITableViewDelegate,UITableViewDataSource {
    var arr = ["公开文章","私密文章","我的收藏","喜欢的文章","我的专题","我的文集","我的钱包"]
    var arr1 = ["夜间模式","浏览记录","通用设置","分享简书","意见反馈","觉的不错，给个好评吧！"]
    let tb = UITableView(frame: CGRectMake(0, 64, 414, 736 - 64), style: .Grouped)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()

        tb.delegate = self
        tb.dataSource = self
        tb.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(tb)
        self.navigationItem.title = "我的"
        self.automaticallyAdjustsScrollViewInsets = false
        registerMyCell()
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    func registerMyCell() {
        let nib = UINib(nibName: "MyCell", bundle: nil)
        tb.registerNib(nib, forCellReuseIdentifier: "MyCell")
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let cell = tb.dequeueReusableCellWithIdentifier("MyCell") as! MyCell
        cell.accessoryType = .DisclosureIndicator
        switch indexPath.section {
        case 1:
            cell.title?.text = arr[indexPath.row]
            cell.iView.image = UIImage(named: "\(indexPath.row + 1)")
            cell.number.text = String(indexPath.row)
        case 2:
            cell.iView.image = UIImage(named: "c\(indexPath.row + 1)")
            cell.title?.text = arr1[indexPath.row]
            cell.number.text = String(indexPath.row)
        default:
            cell.title?.text = "hahah"
        }
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return arr.count
        default:
            return arr1.count
        }
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 80
        default:
            return 60
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        default:
            return 20
        }
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
