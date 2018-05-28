//
//  TestView.swift
//  YMPopoView_Example
//
//  Created by mini on 2018/5/28.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import YMPopoView

class TestView: YMPopoView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
