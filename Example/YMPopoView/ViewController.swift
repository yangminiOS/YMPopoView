//
//  ViewController.swift
//  YMPopoView
//
//  Created by 641077035@qq.com on 05/23/2018.
//  Copyright (c) 2018 641077035@qq.com. All rights reserved.
//

import UIKit
import YMPopoView
class ViewController: UIViewController {
    
    var isAnimetion: Bool = true
    var isHideAnimetion: Bool = true
    
    var alphaV: CGFloat = 0.7
    
    var whiteV: CGFloat = 0.6
    
    var typeVaule: Int = 1
    
    var test: testView = {
        
        let testV = testView.init(frame: CGRect.init(x: 40, y: 300, width: UIScreen.main.bounds.size.width - 80, height: 300))
        
        return testV
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.view.backgroundColor = UIColor.yellow
        
        let button = UIButton()
        //view.addSubview(button)
        button.frame = CGRect.init(x: 100, y: 100, width: 50, height: 40)
        button.backgroundColor = UIColor.gray
        button.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        
    }
    
    @objc func clickButton(){
        
        //let test = testView.init(frame: CGRect.init(x: 0, y: 300, width: view.frame.size.width, height: 200))
        
        test.type = .YMPopoTypeSheet
        test.backgroundColor = UIColor.red
        
        //YMPopoBackgroundView.BackgroundView.touchToHide = true
        //YMPopoBackgroundView.BackgroundView.whiteAlpha = 0.9
        test.showAddTo(view, true)
    
    }
    
    //show  动画开关
    @IBAction func animtionAction(_ sender: UISwitch) {
        
        isAnimetion = sender.isOn
    }
    //hide  动画开关
    @IBAction func hideAnimationAction(_ sender: UISwitch) {
        
        isHideAnimetion = sender.isOn
    }
    //动画样式
    @IBAction func clickTypeButton(_ sender: UIButton) {
        
        typeVaule = sender.tag
    }
    
    //背景的alpha
    @IBAction func changeAlpha(_ sender: UISlider) {
        alphaV = CGFloat(sender.value)
    }
    
    //背景的颜色
    @IBAction func changeWhite(_ sender: UISlider) {
        whiteV = CGFloat(sender.value)
    }
    
    @IBAction func showAction(_ sender: Any) {
        
        //let test = testView.init(frame: CGRect.init(x: 0, y: 300, width: view.frame.size.width, height: 200))
        test.isHideDefaultAnimate = isHideAnimetion
        if(typeVaule == 1){
            test.type = .YMPopoTypeAlert
        }else if(typeVaule == 2){
            test.type = .YMPopoTypeSheet
        }else if(typeVaule == 3){
            test.type = .YMPopoTypeLeft
        }else if(typeVaule == 4){
            test.type = .YMPopoTypeRight
        }
        YMPopoBackgroundView.BackgroundView.alphaVaule = alphaV
        YMPopoBackgroundView.BackgroundView.whiteAlpha = whiteV
        
        test.backgroundColor = UIColor.white
        
        //YMPopoBackgroundView.BackgroundView.touchToHide = true
        //YMPopoBackgroundView.BackgroundView.whiteAlpha = 0.9
        test.showAddTo(view, isAnimetion)
    }
}

