//
//  YMPopoView.swift
//  PopoView
//
//  Created by mini on 2018/5/4.
//  Copyright © 2018年 miniYang. All rights reserved.
//

import UIKit

public enum YMPopoType: Int {
    
    case YMPopoTypeAlert = 1
    
    case YMPopoTypeSheet = 2
    
    case YMPopoTypeCustom = 3
}

open class YMPopoView: UIView {
    
    var YMPopoViewBlock: (() ->())!
    var YMPopoCompletionBlock: (() ->())!
    
    var attachedView: UIView!
    
    var type: YMPopoType = .YMPopoTypeCustom
    
    //动画时间
    var animationDuration: TimeInterval = 0.3
    
    // 在视图消失的时候  动画最终的alpha值
    
    var hideAlpha: CGFloat = 0.2
    
    //默认的动画
    var isDefaultAnimate: Bool = true
    
    open  func show() {
        
        YMPopoWindow.window.makeKeyAndVisible()
        YMPopoWindow.window.isHidden = false
        YMPopoWindow.window.addSubview(self)
    }
    
    open func hide() {
        
        UIView.animate(withDuration: animationDuration, animations: {
            if(self.isDefaultAnimate) {
                self.transform = CGAffineTransform.init(scaleX: 0.1, y: 0.1)
                self.alpha = self.hideAlpha
                YMPopoWindow.hiddAlpha()
            }
            
        }) { (bool) in
            self.removeFromSuperview()
            UIApplication.shared.delegate?.window??.makeKeyAndVisible()
            YMPopoWindow.window.isHidden = true
        }
    }
    
}
