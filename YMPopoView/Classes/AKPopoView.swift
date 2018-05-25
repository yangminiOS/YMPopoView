//
//  YMPopoView.swift
//  PopoView
//
//  Created by mini on 2018/5/4.
//  Copyright © 2018年 miniYang. All rights reserved.
//

import UIKit

public enum YMPopoType: Int {

    case AKPopoTypeAlert = 1
    
    case AKPopoTypeSheet = 2
    
    case AKPopoTypeCustom = 3
}

open class AKPopoView: UIView {
    
    var AKPopoViewBlock: (() ->())!
    var AKPopoCompletionBlock: (() ->())!
    
    var attachedView: UIView!
    
    var type: YMPopoType = .AKPopoTypeCustom
    
    //动画时间
    var animationDuration: TimeInterval = 0.3
    
    // 在视图消失的时候  动画最终的alpha值
    
    var hideAlpha: CGFloat = 0.2
    
    //默认的动画
    var isDefaultAnimate: Bool = true

     open  func show() {
        
        AKPopoWindow.shareWindow().makeKeyAndVisible()
        AKPopoWindow.shareWindow().isHidden = false
        AKPopoWindow.shareWindow().addSubview(self)
    }
    
     open func hide() {
       
        UIView.animate(withDuration: animationDuration, animations: {
            if(self.isDefaultAnimate) {
                
                self.transform = CGAffineTransform.init(scaleX: 0.1, y: 0.1)
                self.alpha = self.hideAlpha
                AKPopoWindow.hiddAlpha()
            }
           
        }) { (bool) in
            self.removeFromSuperview()
            UIApplication.shared.delegate?.window??.makeKeyAndVisible()
            AKPopoWindow.shareWindow().isHidden = true
        }
    }
 
}
