//
//  MainView.swift
//  JSByZYF
//
//  Created by zhyunfe on 16/9/23.
//  Copyright © 2016年 zhyunfe. All rights reserved.
//

import UIKit

class MainView: UITabBarController,UITabBarControllerDelegate {
    let button = UIButton()
    let width = UIScreen.mainScreen().bounds.size.width
    let height = UIScreen.mainScreen().bounds.size.height
    let tabbar = ZYF_Main_MyTabBar()
    var VC = [UINavigationController]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.hidden = true
        let views = [ZYF_Main_FindView(),ZYF_Main_FocusView(),ZYF_Main_MessageView(),ZYF_Main_MyView()]
        for view in views {
            let vc = UINavigationController(rootViewController: view)
            VC.append(vc)
        }
        VC[3].tabBarItem.badgeValue = String(99)
        self.delegate = self
        self.viewControllers = VC
        tabbar.frame = CGRectMake(0, height - 49, width, 49)
        let title = ["发现","关注","","消息","我的"]
        let imageName = ["find","focus","center","message","contact"]
        let selectedImage = ["sfind","sfocs","center","smessage","smy"]
        tabbar.creatTabBar(title, imageNames: imageName, selectedImageNames: selectedImage, space: 83)

        //使用闭包中的值
        tabbar.clickBlock = {(selcted:Int) in
            if selcted == 999 {
                print("点击了扫码按钮")
            } else {
                print(123)
                self.selectedIndex = selcted
            }
        }
        self.view.addSubview(tabbar)

    }
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        let view = VC[2] as UINavigationController
        view.tabBarItem.badgeValue = nil
    }

}
