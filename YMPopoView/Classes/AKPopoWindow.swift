//
//  AKPopoWindow.swift
//  PopoView
//
//  Created by mini on 2018/5/23.
//  Copyright © 2018年 miniYang. All rights reserved.
//

import UIKit

public class AKPopoWindow: UIWindow {
    
    public var touchToHide: Bool = false
    
    public var alphaVaule: CGFloat = 0.6
    
    public var whiteAlpha: CGFloat = 0.7
    
    public var level:CGFloat = 0.9
    
    static var window: AKPopoWindow? = nil
    
    public static func shareWindow() ->AKPopoWindow {
        
        if let share = window {
            share.backgroundColor = UIColor.init(white: share.whiteAlpha, alpha: share.alphaVaule)
            
            return share
        }else{
            window = AKPopoWindow()
            window!.windowLevel = UIWindowLevelStatusBar + window!.level
            window!.frame = UIScreen.main.bounds
            window!.backgroundColor = UIColor.init(white: window!.whiteAlpha, alpha: window!.alphaVaule)
            //let tap = UITapGestureRecognizer.init(target: window!, action: #selector(tapWindow(_:)))
            //window!.addGestureRecognizer(tap)
            return window!
        }
    }
    
    static func hiddAlpha() {
        
        if let share = window {
            share.backgroundColor = UIColor.init(white: share.whiteAlpha, alpha: 0)
        }
        
        
    }
    
    static func attechView() ->UIView {
        
        return UIView.init()
    }

    
    @objc func tapWindow(_ tap: UITapGestureRecognizer) {
        
        if let share = AKPopoWindow.window {
            if(share.touchToHide) {
                
                for subView in share.subviews {
                    if let sub = subView as? AKPopoView {
                        sub.hide()
                    }
                }
            }
        }
    }
}
