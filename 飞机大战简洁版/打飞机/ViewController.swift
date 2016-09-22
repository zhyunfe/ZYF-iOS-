//
//  ViewController.swift
//  打飞机
//
//  Created by zhyunfe on 16/9/22.
//  Copyright © 2016年 zhyunfe. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    //创建一个用来去管理敌机的数组
    var enemyPlanes = [EnemyPlane]()
    //创建我的子弹数组
    var myBullets = [MyBullet]()
    //创建敌人子弹数组
    var enemyBullets = [EnemyBullet]()
    //用来控制子弹产生速度的变两年
    var n = 0//我的子弹
    var m = 0//敌人的子弹
    var timer: NSTimer?

    //记分牌
    let scoreLabel = UILabel()
    var score = 0
    //
    var avPlayer: AVAudioPlayer?
    var avPlayer1: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        bacAVPlayer()
        //准备背景图
        self.prepareBGImageView()
        //加入记分牌
        self.creatLabel()
        //调用我的飞机
        self.creatMyPlane()

        self.creatTimer()
        creatSwipe()
    }

    //准备背景图
    func prepareBGImageView() {
        let bgImageView = UIImageView.init()
        bgImageView.frame = UIScreen.mainScreen().bounds
        bgImageView.image = UIImage(named: "background")
        self.view.addSubview(bgImageView)
    }

    //准备计分牌
    func creatLabel() {
        scoreLabel.frame = CGRectMake(0, 20, 414, 30)
        scoreLabel.text = "0"
        scoreLabel.textAlignment = .Center
        scoreLabel.font = UIFont.systemFontOfSize(25)
        scoreLabel.textColor = UIColor.redColor()
        scoreLabel.backgroundColor = UIColor.cyanColor()
        scoreLabel.alpha = 0.8
        self.view.addSubview(scoreLabel)
    }

    //创建我的飞机
    func creatMyPlane() {
        let myPlane = MyPlane.defaultMyPlane()
        self.view.addSubview(myPlane)

        let direction = Direction()
        self.view.addSubview(direction)
    }

    //创建敌机
    func creatEnemyPlane() {
        let n = arc4random_uniform(5)
        if n == 0{
            let plane = EnemyPlane(frame:CGRectMake(0, 0, 0, 0))
            enemyPlanes.append(plane)
            self.view.addSubview(plane)
        }
    }
    //创建一个计时器
    func creatTimer() {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(self.gameManager), userInfo: nil
            , repeats: true)

    }
    //创建计时器管理者
    func gameManager() {
        self.creatEnemyPlane()
        self.moveEnemyPlanes()
        self.creatMyBullet()
        //让我的子弹飞
        self.moveMyBullet()
        self.creatEnemyBullet()
        self.moveEnemyBullet()
        //判断是否飞出边界
        self.isBeyoundBounds()
        self.cashCheck()
    }
    //让敌机飞起来的方法
    func moveEnemyPlanes() {
        for enemyPlane in enemyPlanes {
            enemyPlane.fly()
        }
    }
    //创建我的子弹
    func creatMyBullet() {
        n += 1
        if n % 3 == 0 {
            for i in 0...1{
                //将我的飞机传进去
                let myBullet = MyBullet(plane: MyPlane.defaultMyPlane())
                self.view.insertSubview(myBullet, belowSubview: MyPlane.defaultMyPlane())
                //将我的子弹加到数组里
                self.myBullets.append(myBullet)
                if i == 0 {
                    myBullet.center.x -= 8
                } else {
                    myBullet.center.x += 8
                }
            }
        }
    }
    //让我的子弹飞
    func moveMyBullet() {
        //遍历我的子弹，让子弹飞
        for mb in myBullets {
            mb.bulletFlying()
        }
    }
    //创建敌人的子弹
    func creatEnemyBullet() {
        m += 1
        if m % 5 == 0 {
            //要给每一架飞机创建子弹
            for plane in enemyPlanes {
                //将敌机传进去，方便子弹确定自己的位置
                let enemyBullet = EnemyBullet(plane: plane)
                //加到屏幕上自己飞机的下面
                self.view.insertSubview(enemyBullet, belowSubview: plane)
                self.enemyBullets.append(enemyBullet)
            }
        }
    }
    //让敌人的子弹飞
    func moveEnemyBullet() {
        for eb in enemyBullets {
            eb.bulletFlying()
        }
    }
    //判断所有的视图是否飞出边界
    func isBeyoundBounds() {
        for mb in myBullets {
            if mb.center.y < 30 {
                //从屏幕上移除
                mb.removeFromSuperview()
                //从数组中移除
                let index = myBullets.indexOf(mb)
                myBullets.removeAtIndex(index!)
            }
        }

        //敌机
        for ep in enemyPlanes {
            if ep.center.y > 700 {
                ep.removeFromSuperview()
                let index = enemyPlanes.indexOf(ep)
                enemyPlanes.removeAtIndex(index!)
            }
        }
        //敌机子弹
        for eb in enemyBullets {
            if eb.center.y > 700 {
                eb.removeFromSuperview()
                let index = enemyBullets.indexOf(eb)
                enemyBullets.removeAtIndex(index!)
            }
        }
    }
    func creatSwipe() {
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(self.swipe(_:)))
        swipe.direction = [.Right,.Left]
        self.view.addGestureRecognizer(swipe)

    }
    func swipe(swipe:UISwipeGestureRecognizer){
        if swipe.direction == [.Right] {
            MyPlane.defaultMyPlane().center.x += 10
        } else {
            MyPlane.defaultMyPlane().center.x -= 10
        }
        print(123)
    }
    let avarr = ["enemy1_down","enemy2_down","enemy2_out","enemy3_down"]
    //碰撞检测
    func cashCheck() {
        //遍历我所有的子弹
        //判断有没有和敌机产生交集，如果有，说明打中了，应该计分消失
        for mb in myBullets {
            //遍历敌机
            for ep in enemyPlanes {
                //CGRectIntersectsRect 方法用来判断两个frame是否相交
                if CGRectIntersectsRect(mb.frame, ep.frame) {
                    let n = Int(arc4random() % 4)
                    AVPlayer(avarr[n])
                    ep.startAnimating()
                    //移除飞机
                    let index = enemyPlanes.indexOf(ep)
                    enemyPlanes.removeAtIndex(index!)
                    //0.5s之后执行删除语句
                    ep.performSelector(#selector(ep.removeFromSuperview), withObject: nil, afterDelay: 0.5 )
                    score += 10
                    //更新成绩
                    scoreLabel.text = String(score)

                    //移除子弹
                    let index1 = myBullets.indexOf(mb)
                    myBullets.removeAtIndex(index1!)
                    mb.removeFromSuperview()
                    break;
                }
            }
        }

        //检测我的飞机和敌机或子弹的碰撞
        let myPlane = MyPlane.defaultMyPlane()
        for ep in enemyPlanes {
            if CGRectIntersectsRect(ep.frame, myPlane.frame) {
                //如果碰上了，双飞
                AVPlayer("game_over")
                ep.startAnimating()
                myPlane.startAnimating()
                //停止计时器
                self.removeAll()
                timer?.fireDate = NSDate.distantFuture()
                //弹个框
                let alert = UIAlertController.init(title: "警告", message: "你挂了，成绩是\(score)分", preferredStyle: .Alert)
                let action = UIAlertAction.init(title: "确定", style: .Default, handler: { (b) in
                    self.timer?.fireDate = NSDate.distantPast()
                    self.score = 0
                    self.scoreLabel.text = String(self.score)
                    self.bacAVPlayer()
                })
                alert.addAction(action)
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
        for eb in enemyBullets {
            if CGRectIntersectsRect(eb.frame, myPlane.frame) {
                //如果碰上了，双飞
                AVPlayer("game_over")
                avPlayer?.stop()
                myPlane.startAnimating()
                self.removeAll()
                timer?.fireDate = NSDate.distantFuture()
                //弹个框
                let alert = UIAlertController.init(title: "警告", message: "你挂了，成绩是\(score)分", preferredStyle: .Alert)
                let action = UIAlertAction.init(title: "重新开始", style: .Default, handler: { (b) in
                    self.timer?.fireDate = NSDate.distantPast()
                    self.score = 0
                    self.scoreLabel.text = String(self.score)
                    self.bacAVPlayer()
                })
                alert.addAction(action)
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    func removeAll() {
        for i in enemyBullets {
            i.removeFromSuperview()
        }
        for i in enemyPlanes {
            i.removeFromSuperview()
        }
        for i in myBullets {
            i.removeFromSuperview()
        }
        enemyBullets.removeAll()
        enemyPlanes.removeAll()
        myBullets.removeAll()
    }

    func bacAVPlayer() {
        let path = NSBundle.mainBundle().pathForResource("game_music", ofType: "mp3")
        let url = NSURL.init(fileURLWithPath: path!)
        avPlayer = try! AVAudioPlayer.init(contentsOfURL: url)
        avPlayer?.prepareToPlay()
        avPlayer?.play()
        avPlayer?.numberOfLoops = -1
    }
    func AVPlayer(type:String) {
        let path = NSBundle.mainBundle().pathForResource(type, ofType: "mp3")
        let url = NSURL.init(fileURLWithPath: path!)
        avPlayer1 = try! AVAudioPlayer.init(contentsOfURL: url)
        avPlayer1?.prepareToPlay()
        avPlayer1?.play()
        avPlayer1?.numberOfLoops = 0
    }

}

