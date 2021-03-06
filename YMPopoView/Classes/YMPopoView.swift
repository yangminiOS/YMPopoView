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
    
    case YMPopoTypeRight = 3
    
    case YMPopoTypeLeft = 4
    
    case YMPopoTypeTop = 5
    
    case YMPopoTypeCustom = 10
}

open class YMPopoView: UIView {
    
    //动画的形式
    open var type: YMPopoType = .YMPopoTypeAlert
    
    //展示动画时间
    open var showAnimationDuration: TimeInterval = 0.3
    //动画消失时间
    open var hideAnimationDuration: TimeInterval = 0.3
    
    // 在视图消失的时候  动画最终的alpha值
    
    open var hideAlpha: CGFloat = 0.2
    
    open var defaultAlpha: CGFloat = 1.0
    
    var orignFrame: CGRect = CGRect.zero
    
    //默认的动画
    public var isShowDefaultAnimate: Bool = true
    
    public var isHideDefaultAnimate: Bool = true
    
    private var orginalX: CGFloat = 0.0
    private var orginalY: CGFloat = 0.0

    open  func show() {
        
        showAddTo(nil, true)
    }
    
    open func showAddTo(_ view: UIView? = nil, _ animated: Bool) {
        YMPopoBackgroundView.BackgroundView.addSubview(self)
        YMPopoBackgroundView.showBackgroundView(view)
        self.alpha = defaultAlpha
        isShowDefaultAnimate = animated
        if(animated) {
            orignFrame = self.frame
            switch type {
                
            case .YMPopoTypeSheet:
                orginalY = self.frame.origin.y
                self.frame.origin.y = UIScreen.main.bounds.height
                
            case .YMPopoTypeLeft:
                orginalX = self.frame.origin.x
                self.frame.origin.x = -self.frame.size.width
                
            case .YMPopoTypeRight:
                orginalX = self.frame.origin.x
                self.frame.origin.x = UIScreen.main.bounds.width
                
            default:
                debugPrint("default")
            }
            
            UIView.animate(withDuration: showAnimationDuration, animations: {
                
                self.showAnimationType()
            }) { (bool) in
                
            }
        }
    }
    
    
     open func hide() {
       
        hide(isHideDefaultAnimate)
    
    }
    
    open func hide(_ animated: Bool) {
        isHideDefaultAnimate = animated
        if(animated) {
            
            UIView.animate(withDuration: hideAnimationDuration, animations: {
                self.hideAnimationType()
                self.alpha = self.hideAlpha
                YMPopoBackgroundView.hideAnimated()
                
            }) { (bool) in
                self.removeFromSuperview()
                YMPopoBackgroundView.hideBackgroundView()
                self.transform = CGAffineTransform.identity
                self.frame = self.orignFrame
            }
        }else {
            
            self.removeFromSuperview()
            YMPopoBackgroundView.hideBackgroundView()
        }
        
    }
    
    func hideAnimationType() {
        
        switch type {
        case .YMPopoTypeAlert:
            
            self.transform = CGAffineTransform.init(scaleX: 0.1, y: 0.1)
            
        case .YMPopoTypeSheet:
            
            self.frame.origin.y = UIScreen.main.bounds.height
            
        case .YMPopoTypeLeft:
            
            self.frame.origin.x = -self.frame.size.width
            
        case .YMPopoTypeRight:
            
            self.frame.origin.x = UIScreen.main.bounds.width
            
        default:
            debugPrint("other")
        }
    }
    
    func showAnimationType() {
        
        switch type {
    
        case .YMPopoTypeSheet:
            
            self.frame.origin.y = orginalY
            
        case .YMPopoTypeLeft:
            
            self.frame.origin.x = orginalX
            
        case .YMPopoTypeRight:
            
            self.frame.origin.x = orginalX
            
        default:
            debugPrint("other")
        }
    }
 
}
