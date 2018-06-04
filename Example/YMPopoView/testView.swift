//
//  testView.swift
//  AKPopoView_Example
//
//  Created by mini on 2018/5/23.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import YMPopoView
import SnapKit
class testView: YMPopoView {
    
    var title: UILabel!
    
    var subTitle: UILabel!
    
    var disButton: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        title = UILabel.init()
        self.addSubview(title)
        title.text = "自定义弹框"
        title.textAlignment = .center
        
        subTitle = UILabel.init()
        self.addSubview(subTitle)
        subTitle.numberOfLines = 0
        subTitle.text = "1.import YMPopoView\n2.testView继承YMPopoView\n3.var test = testView.init()\n4.test.show\n5.可以自定义多种参数\n6.test.hide()\n7.更新中，后续加入其它功能"
        //subTitle.textAlignment = .center
        
        disButton = UIButton.init()
        disButton.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        self.addSubview(disButton)
        disButton.setTitle("hide view", for: .normal)
        disButton.backgroundColor = UIColor.red
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //self.hide()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        title.snp.makeConstraints { (make) in
            
            make.left.right.equalTo(self)
            make.top.equalTo(20)
        }
        
        subTitle.snp.makeConstraints { (make) in
            make.left.equalTo(self)
            make.top.equalTo(title.snp.top).offset(30)
            
        }
        
        disButton.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(subTitle.snp.bottom).offset(20)
            make.height.equalTo(30)
            make.bottom.equalTo(-20)
        }
    }
    
    
    @objc func  clickButton() {
    
        self.hide(isHideDefaultAnimate)
        
    }
    

}
