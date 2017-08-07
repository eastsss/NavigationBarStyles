//
//  UIBarButtonItem+CustomItems.swift
//  NavigationBarStyles
//
//  Created by Anatoliy Radchenko on 19/06/2017.
//  Copyright © 2017 NavigationBarStyles. All rights reserved.
//

import UIKit
import SwiftyUtilities

public extension UIBarButtonItem {
    func setActivityIndicator(animating: Bool) {
        button()?.isHidden = animating
        
        if animating {
            activityIndicator()?.startAnimating()
        } else {
            activityIndicator()?.stopAnimating()
        }
    }
    
    func setButton(enabled: Bool) {
        button()?.isEnabled = enabled
    }
    
    func setButton(selected: Bool) {
        button()?.isSelected = selected
    }
}

// MARK: Custom bar button items creation
public extension UIBarButtonItem {
    static func makeImageButton(params: ImageButtonParams) -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.setImage(params.normalImage, for: .normal)
        
        if let highlighted = params.highlightedImage {
            button.setImage(highlighted, for: .selected)
        }
        
        button.addTarget(params.target, action: params.action, for: .touchUpInside)
        
        var frame = CGRect.zero
        
        switch params.widthPolicy {
        case .contentBased:
            frame.size.width = params.normalImage.size.width
        case .fixed(let value):
            frame.size.width = value
        }
        
        frame.size.height = 44
        button.frame = frame
        
        let wrapper = wrapperView(button: button, addingSpinner: params.spinnerParams)
        return UIBarButtonItem(customView: wrapper)
    }
    
    static func makeRoundedTextButton(params: TextButtonParams) -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.setTitle(params.title, for: .normal)
        button.titleLabel?.font = params.titleFont
        button.setTitleColor(params.titleColor, for: .normal)
        button.setTitleColor(params.titleColor.highlighted, for: .highlighted)
        button.contentEdgeInsets = params.contentEdgeInsets
        button.sizeToFit()
        button.layer.cornerRadius = params.cornerRadius
        button.clipsToBounds = params.cornerRadius > 0
        
        if params.backgroundColor == UIColor.clear {
            button.setBackgroundImage(nil, for: .normal)
            button.setBackgroundImage(nil, for: .highlighted)
        } else {
            button.setBackgroundImage(UIImage.withColor(params.backgroundColor), for: .normal)
            button.setBackgroundImage(UIImage.withColor(params.backgroundColor.highlighted), for: .highlighted)
        }
        
        button.addTarget(params.target, action: params.action, for: .touchUpInside)
        
        if case .fixed(let value) = params.heightPolicy {
            var frame = button.frame
            frame.size.height = value
            button.frame = frame
        }
        
        let wrapper = wrapperView(button: button, addingSpinner: params.spinnerParams)
        return UIBarButtonItem(customView: wrapper)
    }
    
    fileprivate static func addCenteredSpinner(to view: UIView, params: SpinnerParams) {
        let center = CGPoint(x: view.frame.midX, y: view.frame.midY)
        let spinner = makeSpinner(params: params, center: center)
        view.addSubview(spinner)
    }
    
    fileprivate static func makeSpinner(params: SpinnerParams, center: CGPoint) -> UIActivityIndicatorView {
        let style: UIActivityIndicatorViewStyle
        
        if params.isLarge {
            style = .whiteLarge
        } else {
            style = .white
        }
        
        let spinner = UIActivityIndicatorView(activityIndicatorStyle: style)
        
        spinner.hidesWhenStopped = true
        spinner.sizeToFit()
        spinner.center = center
        spinner.color = params.color
        
        return spinner
    }
    
    fileprivate static func wrapperView(button: UIButton, addingSpinner params: SpinnerParams?) -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.frame = button.bounds
        view.addSubview(button)
        
        if let spinnerParams = params {
            addCenteredSpinner(to: view, params: spinnerParams)
        }
        
        return view
    }
}

// MARK: Get subviews
private extension UIBarButtonItem {
    func button() -> UIButton? {
        return subview(withType: UIButton.self)
    }
    
    func activityIndicator() -> UIActivityIndicatorView? {
        return subview(withType: UIActivityIndicatorView.self)
    }
    
    func subview<T: UIView>(withType type: T.Type) -> T? {
        if let itself = customView as? T {
            return itself
        }
        
        guard let subviews = customView?.subviews else {
            return nil
        }
        
        for view in subviews {
            if let v = view as? T {
                return v
            }
        }
        
        return nil
    }
}
