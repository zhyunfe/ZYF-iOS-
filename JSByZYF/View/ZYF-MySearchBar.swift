//
//  ZYF-MySearchBar.swift
//  JSByZYF
//
//  Created by zhyunfe on 16/9/29.
//  Copyright © 2016年 zhyunfe. All rights reserved.
//

import UIKit

class ZYF_MySearchBar: UISearchBar,UISearchBarDelegate {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRectMake(0, 0, 414, 50)
        self.placeholder = "搜索简书的内容和朋友"
        self.barTintColor = UIColor.whiteColor()
        self.layer.borderColor = UIColor.whiteColor().CGColor
        //        获取searchBar的background层
        let view = self.subviews.first?.subviews.first
        view?.removeFromSuperview()
        //获取searchBar的TextFeild层
        let tf = self.subviews.first?.subviews.last as! UITextField
        tf.backgroundColor = UIColor.init(red: 252 / 255, green: 252 / 255, blue: 252 / 255, alpha: 1)
        tf.frame = CGRectMake(0, 0, 0, 50)
        tf.enabled = false

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
}