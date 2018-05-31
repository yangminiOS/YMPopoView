//
//  testView.swift
//  AKPopoView_Example
//
//  Created by mini on 2018/5/23.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import YMPopoView
class testView: YMPopoView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let buttton = UIButton.init()
        buttton.frame = CGRect.init(x: 30, y: 30, width: 40, height: 30)
        buttton.backgroundColor = UIColor.green
        self.addSubview(buttton)
        buttton.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //self.hide()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func  clickButton() {
    
        self.hide(isHideDefaultAnimate)
        
    }
    

}
