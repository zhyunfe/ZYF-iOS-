//
//  ZYF-Main-MessageView.swift
//  JSByZYF
//
//  Created by zhyunfe on 16/9/23.
//  Copyright © 2016年 zhyunfe. All rights reserved.
//

import UIKit

class ZYF_Main_MessageView: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var arr = ["评论","简信","投稿请求","喜欢","关注","打赏","其他"]
    let tb = UITableView(frame: UIScreen.mainScreen().bounds)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        tb.delegate = self
        tb.dataSource = self
        self.view.addSubview(tb)
        self.navigationItem.title = "消息"

    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let str = "str"
        var cell = tableView.dequeueReusableCellWithIdentifier(str)
        if cell == nil {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: str)
            cell?.accessoryType = .DisclosureIndicator
        }
        cell?.textLabel?.text = arr[indexPath.row]
        if indexPath.row == arr.count - 1 {
            cell?.detailTextLabel?.text = "有用户关注你的专题等"
        }
        return cell!
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
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
