//
//  ViewController.swift
//  UIButton
//
//  Created by zhyunfe on 16/9/20.
//  Copyright © 2016年 zhyunfe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var imageArr = [UIImage]()
    var sendArr = [UIImage]()
    var labelImageView = [UIImageView]()
    var btn: UIButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        creatUI()
        creatImage()
        creatQQKeyBoard()
    }
    func creatUI() {
        let tf = UILabel.init(frame: CGRectMake(50, 300, 314, 150))
        tf.backgroundColor = UIColor.cyanColor()
        tf.tag = 1000

        let label = UILabel.init(frame: CGRectMake(50, 70, 314, 150))
        label.backgroundColor = UIColor.cyanColor()
        label.tag = 2000

        let sendBtn = UIButton(type: .System)
        sendBtn.frame = CGRectMake(414 / 2 - 20, 260, 40, 30)
        sendBtn.setTitle("发送", forState: .Normal)
        sendBtn.addTarget(self, action: #selector(self.sendBtnClick(_:)), forControlEvents: .TouchUpInside)

        let showBtn = UIButton(type: .System)
        showBtn.frame = CGRectMake(100, 470, 40, 30)
        showBtn.setTitle("展示", forState: .Normal)
        showBtn.addTarget(self, action: #selector(self.showBtn(_:)), forControlEvents: .TouchUpInside)
        showBtn.tag = 20

        let hideBtn = UIButton(type: .System)
        hideBtn.setTitle("隐藏", forState: .Normal)
        hideBtn.frame = CGRectMake(280, 470, 40, 30)
        hideBtn.addTarget(self, action: #selector(self.hideBtn(_:)), forControlEvents: .TouchUpInside)

        self.view.addSubview(showBtn)
        self.view.addSubview(hideBtn)
        self.view.addSubview(tf)
        self.view.addSubview(label)
        self.view.addSubview(sendBtn)

    }

    //创建图片对象
    func creatImage() {
        for i in 1...103 {
            if i < 10{
                let image = UIImage.init(named: "00\(i)")
                imageArr.append(image!)
            } else if i > 99 {
                let image = UIImage.init(named: "\(i)")
                imageArr.append(image!)
            } else {
                let image = UIImage.init(named: "0\(i)")
                imageArr.append(image!)
            }
        }
        print(imageArr.count)
    }
    //创建键盘
    func creatQQKeyBoard() {
        let view = UIView.init(frame: CGRectMake(0, 736, 414, 200))
        view.backgroundColor = UIColor.redColor()
        view.tag = 100
        for i in 1...103 {
            let btn = UIButton.init(type: .Custom)
            btn.frame = CGRectMake(10 + 25 * CGFloat(((i - 1) % 16)), 10 + 25 * CGFloat(((i - 1) / 16)), 25, 25)
            btn.tag = 10 + i
            btn.setBackgroundImage(imageArr[i - 1], forState: .Normal)
            btn.addTarget( self, action: #selector(self.btnClick(_:)), forControlEvents: .TouchUpInside)
            view.addSubview(btn)
        }
        self.view.addSubview(view)
    }

    //键盘点击事件
    var n = -1
    func btnClick(sender:UIButton) {
        n += 1
        let label = self.view.viewWithTag(1000) as! UILabel
        let imageView = UIImageView.init(frame: CGRectMake(2 + CGFloat(n) % 12 * 25, CGFloat(n / 12) * 25, 25, 25))
        print(CGFloat(n / 12) * 25)
        imageView.image = imageArr[sender.tag - 11]
        label.addSubview(imageView)
        sendArr.append(imageArr[sender.tag - 11])
        labelImageView.append(imageView)
    }

    //隐藏键盘点击事件
    func hideBtn(sender:UIButton) {
        let showBtn = self.view.viewWithTag(20) as! UIButton
        if showBtn.enabled == false {
            let keyBoard = self.view.viewWithTag(100)! as UIView
            UIView.animateWithDuration(0.1, animations: {
                keyBoard.center.y += 200
                print(keyBoard.bounds.size.height)
            }) { (b) in
                print("隐藏键盘")
            }
            self.btn.enabled = true
            sender.enabled = false
            self.btn = sender
        }

    }

    //展示键盘点击事件
    func showBtn(sender:UIButton) {
        let keyBoard = self.view.viewWithTag(100)! as UIView
        UIView.animateWithDuration(0.1, animations: {
            keyBoard.center.y -= 200
            print(keyBoard.bounds.size.height)
        }) { (b) in
            print("打开键盘")
        }
        self.btn.enabled = true
        sender.enabled = false
        self.btn = sender
    }
    //发送按钮
    func sendBtnClick(sender:UIButton) {
        let label = self.view.viewWithTag(2000) as! UILabel
        if sendArr.count > 0 {
            for i in 1...sendArr.count {
                let imageView = UIImageView.init(frame: CGRectMake(2 + CGFloat(i - 1) % 12 * 25, CGFloat((i - 1) / 12) * 25, 25, 25))
                imageView.image = sendArr[i - 1]
                label.addSubview(imageView)
            }
            for imageView in labelImageView {
                imageView.removeFromSuperview()
                n = -1
            }
            labelImageView.removeAll()
        }
    }
}

