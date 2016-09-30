//
//  LoginView.swift
//  JSByZYF
//
//  Created by zhyunfe on 16/9/22.
//  Copyright © 2016年 zhyunfe. All rights reserved.
//

import UIKit

class LoginView: UIViewController,UITextFieldDelegate {



    
    @IBOutlet weak var account: UITextField!
    @IBOutlet weak var registeAccount: UIButton!

    @IBOutlet weak var cancel: UIImageView!
    @IBOutlet weak var pwdTf: UITextField!
    @IBOutlet weak var pwdLabel: UILabel!
    @IBOutlet weak var usrLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = true
        setLable()
        addTap()
    }
    func setLable() {
        usrLabel.layer.borderWidth = 1
        usrLabel.layer.borderColor =  UIColor.init(red: 238 / 255, green: 238 / 255, blue: 238 / 255, alpha: 1).CGColor
        pwdLabel.layer.borderWidth = 1
        pwdLabel.layer.borderColor = UIColor.init(red: 238 / 255, green: 238 / 255, blue: 238 / 255, alpha: 1).CGColor
        let btn = UIButton.init(frame: CGRectMake(0, 0, 50, 50))
        btn.setBackgroundImage(UIImage(named:"ZYF-Login-rightView"), forState: .Normal)
        pwdTf.rightView = btn
        btn.addTarget(self, action: #selector(self.rightViewBtn), forControlEvents: .TouchUpInside)
        pwdTf.rightViewMode = .Always
        pwdTf.rightView!.tag = 207
    }
    @IBAction func registeAccount(sender: UIButton) {
        self.navigationController?.pushViewController(RegisteViewController(), animated: true)
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        pwdTf.resignFirstResponder()
        account.resignFirstResponder()
        return true
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        pwdTf.resignFirstResponder()
        account.resignFirstResponder()
    }
    //添加手势
    func addTap() {
        for tag in 201...207 {
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.tap(_:)))
            let imageView = self.view.viewWithTag(tag)
            imageView?.userInteractionEnabled = true
            imageView?.addGestureRecognizer(tap)
        }
    }
    func tap(sender:UITapGestureRecognizer) {
        let n = sender.view?.tag
        switch n! {
        case 201:
            print("微博登录")
        case 202:
            print("QQ登录")
        case 203:
            print("微信登录")
        case 204:
            print("豆瓣登录")
        case 205:
            print("谷歌登录")
        case 206:
            self.navigationController?.pushViewController(MainView(), animated: true)
        default:
            print("帮助")
        }
    }
    @IBAction func logInBtn(sender: AnyObject) {
        self.navigationController?.pushViewController(MainView(), animated: true)
        print("登录成功，进入主界面")
    }
    @IBAction func toMain(sender: UIButton) {
        self.navigationController?.pushViewController(MainView(), animated: true)
    }
    func rightViewBtn() {
        print("帮助")
    }
}
