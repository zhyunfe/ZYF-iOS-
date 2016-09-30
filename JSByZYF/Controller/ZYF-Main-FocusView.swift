//
//  ZYF-Main-FocusView.swift
//  JSByZYF
//
//  Created by zhyunfe on 16/9/23.
//  Copyright © 2016年 zhyunfe. All rights reserved.
//

import UIKit

class ZYF_Main_FocusView: UIViewController,UITableViewDelegate,UITableViewDataSource{

    let tb = UITableView(frame: UIScreen.mainScreen().bounds)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        tb.delegate = self
        tb.dataSource = self
        tb.bounces = false
        self.view.addSubview(tb)
        creatUISearchController()
        setNavigationBar()
        creatFooter()
    }
    func setNavigationBar() {
        self.navigationItem.title = "全部关注"
        let btn = UIButton(type: .Custom)
        btn.setImage(UIImage(named: "contact"), forState: .Normal)
        btn.frame = CGRectMake(0, 0, 40, 40)
        let bbtn = UIBarButtonItem(customView: btn)
        self.navigationItem.leftBarButtonItem = bbtn

        let btn1 = UIButton(type: .Custom)
        btn1.frame = CGRectMake(0, 0, 40, 40)
        btn1.setImage(UIImage(named: "message"), forState: .Normal)
        let bbtn1 = UIBarButtonItem(customView: btn1)
        self.navigationItem.rightBarButtonItem = bbtn1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let str = "str"
        var cell = tableView.dequeueReusableCellWithIdentifier(str)
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: str)
            cell?.accessoryType = .DisclosureIndicator
        }
        cell?.textLabel?.text = String(indexPath.row)
        return cell!
    }
    
    func creatFooter() {
        let imageView = UIImageView(image: UIImage(named: "footer"))
        imageView.frame = CGRectMake(0, 0, 414, 226)
        let label = UILabel.init(frame: CGRectMake(165, 173, 150, 15))
        imageView.addSubview(label)
        label.userInteractionEnabled = true
        imageView.userInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapAction))
        label.addGestureRecognizer(tap)
        tb.tableFooterView = imageView
    }
    func tapAction() {
        self.navigationController?.pushViewController(SearchResultController(), animated: true)
    }
    func creatUISearchController() {
        let searchBar = ZYF_MySearchBar()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.searchBtn))
        tb.tableHeaderView = searchBar
        searchBar.placeholder = "搜索关注源"
        searchBar.addGestureRecognizer(tap)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func searchBtn() {
        self.navigationController?.pushViewController(SearchResultController(), animated: true)
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
