//
//  EnemyPlane.swift
//  打飞机
//
//  Created by zhyunfe on 16/9/22.
//  Copyright © 2016年 zhyunfe. All rights reserved.
//

import UIKit

class EnemyPlane: Plane {


    //因为敌机的位置不固定，要重写构造方法，来去随机敌机的位置
    override init(frame: CGRect) {
        super.init(frame: frame)

        //随机x的值
        let x = arc4random_uniform(414)
        self.frame = CGRectMake(CGFloat(x), 0, 40, 50)

        //随机设置一张图片
        let n = arc4random_uniform(4) + 1
        let imageName = "enemy\(n)"
        self.image = UIImage(named: imageName)

        //速度
        self.ySpeed = CGFloat(arc4random_uniform(10) + 5)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
