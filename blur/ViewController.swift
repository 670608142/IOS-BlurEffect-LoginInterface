//
//  ViewController.swift
//  blur
//
//  Created by jacob on 2018/3/1.
//  Copyright © 2018年 jacob. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageview: UIImageView!
    var picnum:Int = 0
    var timer:Timer!
    var timer1:Timer!
    var timer2:Timer!
    var timer3:Timer!
    var blurval = 0
    
    @IBOutlet weak var idtext: UITextField!
    
    @IBOutlet weak var pawtext: UITextField!
    
    @IBOutlet weak var loginbtn: UIButton!
    
    @IBOutlet weak var signupbtn: UIButton!
    
    @IBOutlet weak var titlelabel: UILabel!
    
    @IBOutlet weak var blurview: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picnum = randomIn(min:1,max:9)
        imageview.image = UIImage(named: "image\(picnum).jpg")
        // 启用计时器，控制每秒执行一次tickDown方法
        timer = Timer.scheduledTimer(timeInterval: 0.05, target:self,selector:#selector(ViewController.tickDown),userInfo:nil,repeats:true)
        //设置透明度为0
        blurview.alpha=0
        titlelabel.alpha=0
        idtext.alpha=0
        pawtext.alpha=0
        loginbtn.alpha=0
        signupbtn.alpha=0
        //设置左边图标
        idtext.leftView = UIImageView(image: UIImage(named: "user.png"))
        idtext.leftViewMode = UITextFieldViewMode.always
        pawtext.leftView = UIImageView(image: UIImage(named: "lock.png"))
        pawtext.leftViewMode = UITextFieldViewMode.always
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //生成10以内的随机数
    func randomIn(min: Int, max: Int) -> Int {
        return Int(arc4random()) % (max - min + 1) + min
    }

    
    //模糊动画
    func tickDown(){
        //if blurview.alpha == 0{sleep(2)}
        blurview.alpha = blurview.alpha + 0.02
        if blurview.alpha > 0.98{timer.invalidate()
            titlelabel.alpha = 0.1
            loginbtn.alpha = 0.1
            signupbtn.alpha = 0.1
            timer1 = Timer.scheduledTimer(timeInterval: 0.05, target:self,selector:#selector(ViewController.tickDown1),userInfo:nil,repeats:true)}
    }
    //按钮和文本出现动画
    func tickDown1(){
        titlelabel.alpha = titlelabel.alpha + 0.02
        idtext.alpha = idtext.alpha + 0.02
        pawtext.alpha = pawtext.alpha + 0.02
        loginbtn.alpha = loginbtn.alpha + 0.02
        signupbtn.alpha = signupbtn.alpha + 0.02
        if titlelabel.alpha > 0.98{timer1.invalidate()
        }
    }
}

