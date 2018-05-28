//
//  AKPopoWindow.swift
//  PopoView
//
//  Created by mini on 2018/5/23.
//  Copyright © 2018年 miniYang. All rights reserved.
//

import UIKit

public class YMPopoWindow: UIWindow {
    
    public var touchToHide: Bool = false
    
    public var alphaVaule: CGFloat = 0.6
    
    public var whiteAlpha: CGFloat = 0.7
    
    public var level:CGFloat = 0.9
    
    public static var window: YMPopoWindow! = {
        
        let windowView = YMPopoWindow.init()
        
        windowView.rootViewController = UIViewController.init()
        windowView.windowLevel = UIWindowLevelStatusBar + windowView.level
        windowView.frame = UIScreen.main.bounds
        windowView.backgroundColor = UIColor.init(white: windowView.whiteAlpha, alpha: windowView.alphaVaule)
        let tap = UITapGestureRecognizer.init(target: windowView, action: #selector(tapWindow(_:)))
        windowView.addGestureRecognizer(tap)
        
        return windowView
        
    }()
    
    static func hiddAlpha() {
        
        if let share = window {
            share.backgroundColor = UIColor.init(white: share.whiteAlpha, alpha: 0)
        } 
    }
    
    static func attechView() ->UIView {
        
        return (window.rootViewController?.view)!
    }
    
    
    @objc func tapWindow(_ tap: UITapGestureRecognizer) {
        
        if let share = YMPopoWindow.window {
            if(share.touchToHide) {
                
                for subView in share.subviews {
                    if let sub = subView as? YMPopoView {
                        sub.hide()
                    }
                }
            }
        }
    }
}
