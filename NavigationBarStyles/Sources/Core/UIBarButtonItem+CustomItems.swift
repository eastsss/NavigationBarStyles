//
//  UIBarButtonItem+CustomItems.swift
//  NavigationBarStyles
//
//  Created by Anatoliy Radchenko on 19/06/2017.
//  Copyright © 2017 NavigationBarStyles. All rights reserved.
//

import UIKit
import SwiftyUtilities

public struct SpinnerParams {
    public let color: UIColor
    public let isLarge: Bool
    
    public init(color: UIColor = UIColor.gray, isLarge: Bool = false) {
        self.color = color
        self.isLarge = isLarge
    }
}

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
    static func makeButton(configurationBlock: (UIButton) -> Void,
                           spinnerParams: SpinnerParams? = nil,
                           target: AnyObject?,
                           action: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        configurationBlock(button)
        
        button.addTarget(target, action: action, for: .touchUpInside)
        
        let wrapper = wrapperView(button: button, addingSpinner: spinnerParams)
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
