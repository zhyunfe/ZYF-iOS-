//
//  EnemyBullet.swift
//  打飞机
//
//  Created by zhyunfe on 16/9/22.
//  Copyright © 2016年 zhyunfe. All rights reserved.
//

import UIKit

class EnemyBullet: Bullet {

    override init(plane: Plane) {
        super.init(plane: plane)
        //设置背景
        self.image = UIImage(named: "enempbullet")
        self.ySpeed = plane.ySpeed + 10
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
