//
//  YMPopoBackgroundView.swift
//  YMPopoView
//
//  Created by mini on 2018/5/31.
//

import UIKit

public class YMPopoBackgroundView: UIView {
    
    //背景  是否点击后隐藏，默认是点击不可隐藏
    public var touchToHide: Bool = false {
        
        didSet{
            if(touchToHide) {
                let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapBackgroundView(_:)))
                YMPopoBackgroundView.BackgroundView.addGestureRecognizer(tap)
            }
        }
    }
    //背景 的透明度  可设置
    public var alphaVaule: CGFloat = 0.6{
    didSet{
    YMPopoBackgroundView.BackgroundView.backgroundColor = UIColor.init(white: whiteAlpha, alpha: alphaVaule)
        }
    }
    //背景 的颜色  可设置
    public var whiteAlpha: CGFloat = 0.7 {
        didSet{
            YMPopoBackgroundView.BackgroundView.backgroundColor = UIColor.init(white: whiteAlpha, alpha: alphaVaule)
        }
    }
    //背景 初试化方法
    public static let BackgroundView: YMPopoBackgroundView = {
       
        let view = YMPopoBackgroundView()
        
        return view
    }()
    /*
     背景 添加到视图
     
     1.view = nil 添加到当前的window上
     
     2. view != nil 添加到view上
     */
    static func showBackgroundView(_ view: UIView? = nil) {
        YMPopoBackgroundView.BackgroundView.backgroundColor = UIColor.init(white: YMPopoBackgroundView.BackgroundView.whiteAlpha, alpha: YMPopoBackgroundView.BackgroundView.alphaVaule)
        
        if let addView = view {
            
            YMPopoBackgroundView.BackgroundView.frame = addView.bounds
            view?.addSubview(YMPopoBackgroundView.BackgroundView)
            
        }else{
            
            let window = UIApplication.shared.keyWindow
            
            if let keyWindow = window {
                YMPopoBackgroundView.BackgroundView.frame = keyWindow.bounds
                
                keyWindow.addSubview(YMPopoBackgroundView.BackgroundView)
            }
        }
    }
    
    //隐藏背景动画
    static func hideAnimated() {
        YMPopoBackgroundView.BackgroundView.backgroundColor = UIColor.init(white: BackgroundView.whiteAlpha, alpha: 0.0)
    }
    //隐藏背景
    static func hideBackgroundView() {
        YMPopoBackgroundView.BackgroundView.removeFromSuperview()
        
    }
    //当touchToHide = true  点击背景 隐藏
    @objc func tapBackgroundView(_ tap: UITapGestureRecognizer) {
        
        if(touchToHide) {
            
            for subView in YMPopoBackgroundView.BackgroundView.subviews {
                
                if  let view = subView as? YMPopoView {
                    
                    view.hide()
                    
                }
            }
        }
    }
}
