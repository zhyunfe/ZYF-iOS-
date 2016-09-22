//
//  Plane.swift
//  打飞机
//
//  Created by zhyunfe on 16/9/22.
//  Copyright © 2016年 zhyunfe. All rights reserved.
//

import UIKit

class Plane: UIImageView {
    //速度
    var xSpeed: CGFloat = 0
    var ySpeed: CGFloat = 0

    override init(frame: CGRect) {
        super.init(frame: frame)

        //准备飞机的爆炸效果
        var boomImages = [UIImage]()
        for i in 1...20 {
            let image = UIImage(named: "bossbomb\(i)")
            boomImages.append(image!)
        }
        //加到动画数组里
        self.animationImages = boomImages
        //设置动画时间
        self.animationDuration = 0.5
        //设置动画执行次数
        self.animationRepeatCount = 1
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fly() {
        //加个动画
        UIView.animateWithDuration(0.15, animations: {
            self.center.x += self.xSpeed
            self.center.y += self.ySpeed
            }, completion: nil)
    }


}
