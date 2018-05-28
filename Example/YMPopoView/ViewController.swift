//
//  ViewController.swift
//  YMPopoView
//
//  Created by 641077035@qq.com on 05/25/2018.
//  Copyright (c) 2018 641077035@qq.com. All rights reserved.
//

import UIKit
import YMPopoView
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
        let test = TestView.init(frame: CGRect.init(x: 100, y: 100, width: 200, height: 200))
//        view.addSubview(test)
        YMPopoWindow.window.touchToHide = true
        test.show()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

