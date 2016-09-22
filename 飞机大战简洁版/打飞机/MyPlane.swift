//
//  MyPlane.swift
//  打飞机
//
//  Created by zhyunfe on 16/9/22.
//  Copyright © 2016年 zhyunfe. All rights reserved.
//

import UIKit

class MyPlane: Plane {

   //单例是指在整个程序中，无论在哪里创建，返回的都是同一个唯一的实例
    //1、
    //首先定义一个静态变量，来保存当前实例的地址
    //而且这个变量理论上是私有的，被外界不可访问
    static var myPlane = MyPlane()
    //2、
    //公开一个方法
    //一般这种返回单例的方法都是由类名来调用的类型方法
    //默认一般的单例方法都以default / shared /current来开头
    class func defaultMyPlane() -> MyPlane {
        //直接去返回类中的静态变量保存的值
        return myPlane
    }
    //3、
    //私有化初始化构造方法
    private init() {
        super.init(frame: CGRectMake(207 - 30, 640, 60, 60))
        
        //给我的飞机加上图片和速度
        self.image = UIImage(named: "myplane")
        self.xSpeed = 10
        self.ySpeed = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
