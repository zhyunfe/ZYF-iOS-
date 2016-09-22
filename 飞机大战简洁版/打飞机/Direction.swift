//
//  Direction.swift
//  打飞机
//
//  Created by zhyunfe on 16/9/22.
//  Copyright © 2016年 zhyunfe. All rights reserved.
//

import UIKit

class Direction: UIView {

    //加一个控制目标的属性
    var plane = MyPlane.defaultMyPlane()

    //重写方向盘
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRectMake(0, 700, 414, 36)
        self.backgroundColor = UIColor.grayColor()
        self.alpha = 0.8

        //设置左右方向
        let leftBtn = UIButton(type:.System)
        leftBtn.frame = CGRectMake(0, 0, 100, 36)
        leftBtn.setImage(UIImage(named: "button_left"), forState: .Normal)
        leftBtn.addTarget(self, action: #selector(self.btnAction(_:)), forControlEvents: .TouchUpInside)
        leftBtn.tag = 100
        self.addSubview(leftBtn)

        let rightBtn = UIButton(type:.System)
        rightBtn.frame = CGRectMake(314, 0, 100, 36)
        rightBtn.setImage(UIImage(named: "button_right"), forState: .Normal)
        rightBtn.addTarget(self, action: #selector(self.btnAction(_:)), forControlEvents: .TouchUpInside)
        rightBtn.tag = 200
        self.addSubview(rightBtn)
    }
    func btnAction(sender:UIButton) {

        //根据不同的按钮给定移动速度
        if sender.tag == 100 {
            self.plane.xSpeed = -10
        } else {
            self.plane.xSpeed = 10
        }

        //调用飞机的飞行方法
        self.plane.fly()
    }
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
