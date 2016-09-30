//
//  ZYF-Main-FindView.swift
//  JSByZYF
//
//  Created by zhyunfe on 16/9/23.
//  Copyright © 2016年 zhyunfe. All rights reserved.
//

import UIKit

class ZYF_Main_FindView: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UIScrollViewDelegate,UISearchResultsUpdating {
    let width = UIScreen.mainScreen().bounds.size.width
    let height = UIScreen.mainScreen().bounds.size.height
    let scr = ZYF_MyScrollView()
    var dataSource:NSMutableArray?
    let tb = UITableView()
    let imageNames = ["App公测","简书出版","简书官方专题","简书月刊","简书出版","简书官方专题"]
    let page = UIPageControl()
    var timer = NSTimer()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        tb.frame = CGRectMake(0, 20, width, height)
        tb.delegate = self
        tb.dataSource = self
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.addSubview(tb)
        //隐藏导航控制器
        self.navigationController?.navigationBar.hidden = true
        creatScrollView()
        creatTimer()
        registerMyCell()
    }
    func creatScrollView() {
        scr.delegate = self
        scr.creatUI(imageNames, height: 200)
        let view = UIView(frame: CGRectMake(0,0,width,280))
        let imageArr = ["专题精选","实事热点","小说","有奖活动","漫画","简书出版little","实事热点","小说","有奖活动","专题精选","小说"]
        let scrView = UIScrollView.init(frame: CGRectMake(0, 200, width, 80))
        scrView.backgroundColor = UIColor.whiteColor()
        scrView.contentSize = CGSizeMake(11 * 128, 80)
        for i in 0...imageArr.count - 1 {
            let imageView = UIImageView(frame: CGRectMake(20 + CGFloat(i) * 125, 15, 120, 50))
            imageView.layer.cornerRadius = 7
            imageView.layer.masksToBounds = true
            scrView.addSubview(imageView)
            imageView.image = UIImage(named: imageArr[i])
        }
        scr.frame = CGRectMake(0, 0, width, 200)
        page.frame = CGRectMake(width / 2 - 50,160,100,30)
        page.numberOfPages = imageNames.count

        view.insertSubview(page, aboveSubview: scr)
        view.backgroundColor = UIColor.whiteColor()
        view.insertSubview(scr, belowSubview: page)
        view.addSubview(scrView)
        tb.tableHeaderView = view

    }

    //当手动滚动视图翻页时调用该方法
    var cnt = 0
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let cPage = scr.contentOffset.x / width
        page.currentPage = Int(cPage)
        cnt = Int(cPage)
    }

    //自动播放时，调用该方法
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        cnt += 1
        page.currentPage = cnt % imageNames.count
    }
    //搜索框
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let bview = UIView.init()
        bview.backgroundColor = UIColor.whiteColor()
        let searchBar = ZYF_MySearchBar()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.presentResultView))
        searchBar.addGestureRecognizer(tap)
        bview.addSubview(searchBar)
        return bview
    }
    func presentResultView() {
        self.navigationController?.pushViewController(SearchResultController(), animated: true)
        print(123)
    }
    //返回表头高度
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 1:
            return 50
        default:
            return 0
        }
    }
    //注册自定制cell
    func registerMyCell() {
        let nib = UINib(nibName: "ZYF-Find-MyCell", bundle: nil)
        tb.registerNib(nib, forCellReuseIdentifier:"ZYF-Find-MyCell")
    }

    //返回节数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    //自定制cell内容设置
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ZYF-Find-MyCell") as! ZYF_Find_MyCell
        if dataSource?.count > 0 {
            let model = dataSource?.objectAtIndex(indexPath.row) as! UsrModel
            cell.model = model
        }
        return cell
    }
    //每一行的行高
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if dataSource?.count > 0 {
        let model = dataSource?.objectAtIndex(indexPath.row) as! UsrModel
        let height = model.articleTitle!.boundingRectWithSize(CGSizeMake(246, 10000), options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(17)], context: nil).size.height

            return height + 100
        } else {
            return 100
        }
    }
    //每一节的行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 0
        default:
            return 100
        }
    }


    //轮播图定时器
    func creatTimer() {
      timer =  NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: #selector(self.timerManager), userInfo: nil, repeats: true)
    NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)

    }

    //定时器管理者
    func timerManager() {
        scr.setContentOffset(CGPointMake(scr.contentOffset.x + width, 0), animated: true)
        if scr.contentOffset.x == CGFloat(width) * CGFloat(imageNames.count) {
            scr.contentOffset = CGPointMake(0, 0)
        }

    }
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        print(123)
    }
}
