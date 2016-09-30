//
//  ZYF-MyScrollView.swift
//  JSByZYF
//
//  Created by zhyunfe on 16/9/23.
//  Copyright © 2016年 zhyunfe. All rights reserved.
//

import UIKit

class ZYF_MyScrollView: UIScrollView {
    let width = UIScreen.mainScreen().bounds.size.width
    func creatUI(imageName:[String],height:CGFloat) {
        self.backgroundColor = UIColor.whiteColor()
        for i in 0...(imageName.count - 1) {
            let imageView = UIImageView(frame: CGRectMake(CGFloat(i) * width,0,width,height))
            self.addSubview(imageView)
            imageView.image = UIImage(named: imageName[i])
        }

        self.contentSize = CGSizeMake(CGFloat(imageName.count ) * width, height)
        self.bounces = false
        self.pagingEnabled = true
        let imageView = UIImageView(frame:CGRectMake(CGFloat(imageName.count) * width, 0, width, height))
        imageView.image = UIImage(named:imageName[0])
        self.addSubview(imageView)
    }
}
