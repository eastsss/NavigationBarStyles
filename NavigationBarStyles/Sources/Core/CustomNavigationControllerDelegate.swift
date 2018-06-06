//
//  CustomNavigationControllerDelegate.swift
//  NavigationBarStyles
//
//  Created by Anatoliy Radchenko on 19/06/2017.
//  Copyright © 2017 NavigationBarStyles. All rights reserved.
//

import Foundation
import UIKit

public func == (lhs: [String: Any]?, rhs: [String: Any]?) -> Bool {
    switch (lhs, rhs) {
    case (.none, .none):
        return true
    case (.some, .none), (.none, .some):
        return false
    case (.some(let left), .some(let right)):
        return NSDictionary(dictionary: left).isEqual(to: right)
    }
}

class CustomNavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              willShow viewController: UIViewController, animated: Bool) {
        guard let configurable = viewController as? NavigationBarConfigurable else {
            return
        }
        
        let configuration = configurable.preferredNavigationBarConfiguration
        let oldStyle = navigationController.customNavigationBar.style
        let newStyle = configuration.barStyle
        
        if let new = newStyle, let old = oldStyle,
            !equalStyles(lhs: new, rhs: old) {
            navigationController.customNavigationBar.style = newStyle
        } else if navigationController.customNavigationBar.style == nil,
            let newStyle = configuration.barStyle {
            navigationController.customNavigationBar.style = newStyle
        }
        
        navigationController.setNavigationBarHidden(configuration.isHidden, animated: animated)
    }
    
    private func equalStyles(lhs: NavigationBarStyle, rhs: NavigationBarStyle) -> Bool {
        let translucentEqual = lhs.translucent == rhs.translucent
        let bgImageEqual = lhs.backgroundImage == rhs.backgroundImage
        let bgColorEqual = lhs.backgroundColor == rhs.backgroundColor
        let shadowImageEqual = lhs.shadowImage == rhs.shadowImage
//        let titleAttributesEqual = lhs.titleTextAttributes == rhs.titleTextAttributes
        let tintColorEqual = lhs.tintColor == rhs.tintColor
        
        return translucentEqual && bgImageEqual &&
            bgColorEqual && shadowImageEqual && tintColorEqual
    }
}
