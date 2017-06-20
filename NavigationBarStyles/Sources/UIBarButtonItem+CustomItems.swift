//
//  UIBarButtonItem+CustomItems.swift
//  NavigationBarStyles
//
//  Created by Anatoliy Radchenko on 19/06/2017.
//  Copyright © 2017 NavigationBarStyles. All rights reserved.
//

import UIKit
import SwiftyUtilities

public enum ButtonSizePolicy {
    case imageBased
    case fixed(CGFloat)
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
    static func createImageButton(normalImage: UIImage, selectedImage: UIImage?,
                                  widthPolicy: ButtonSizePolicy, target: AnyObject?,
                                  action: Selector) -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(normalImage, for: .normal)
        button.setImage(selectedImage, for: .selected)
        button.addTarget(target, action: action, for: .touchUpInside)
        
        var frame = CGRect.zero
        
        switch widthPolicy {
        case .imageBased:
            frame.size.width = normalImage.size.width
        case .fixed(let value):
            frame.size.width = value
        }
        
        frame.size.height = 44
        button.frame = frame
        
        return button
    }
    
    // swiftlint:disable:next function_parameter_count
    static func createRoundedButton(title: String, titleColor: UIColor,
                                    titleFont: UIFont, backgroundColor: UIColor,
                                    target: AnyObject?, action: Selector) -> UIView {
        let button = UIButton(type: .custom)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = titleFont
        button.setTitleColor(titleColor, for: .normal)
        button.setTitleColor(titleColor.highlighted, for: .highlighted)
        let offsetX: CGFloat = 11.0
        button.contentEdgeInsets = UIEdgeInsets(
            top: 0.0, left: offsetX, bottom: 0.0, right: offsetX)
        button.sizeToFit()
        button.layer.cornerRadius = 4.0
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage.withColor(backgroundColor), for: .normal)
        button.setBackgroundImage(UIImage.withColor(backgroundColor.highlighted), for: .highlighted)
        button.addTarget(target, action: action, for: .touchUpInside)
        
        var frame = button.frame
        frame.size.height = 25.0
        button.frame = frame
        
        let spinner = createSpinner(withCenter: CGPoint(x: button.frame.midX, y: button.frame.midY))
        
        let containerView = UIView()
        containerView.backgroundColor = UIColor.clear
        containerView.frame = frame
        containerView.addSubview(button)
        containerView.addSubview(spinner)
        
        return containerView
    }
    
    static func createSpinner(withCenter center: CGPoint) -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        spinner.hidesWhenStopped = true
        spinner.sizeToFit()
        spinner.center = center
        
        return spinner
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
