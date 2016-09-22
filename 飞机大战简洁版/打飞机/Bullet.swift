//
//  Bullet.swift
//  打飞机
//
//  Created by zhyunfe on 16/9/22.
//  Copyright © 2016年 zhyunfe. All rights reserved.
//

import UIKit

class Bullet: UIImageView {
    //子弹速度
    var ySpeed:CGFloat = 0

    //添加一个构造方法
    init(plane:Plane) {
        super.init(frame: CGRectMake(0, 0, 10, 10))

        //设置位置,子弹的位置在飞机中心点的位置
        self.center = plane.center

        //设置速度
        self.ySpeed = plane.ySpeed + 3
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func bulletFlying() {
        UIView.animateWithDuration(0.5, animations: { 
            self.center.y += self.ySpeed
            }) { (b) in

        }
    }
}
