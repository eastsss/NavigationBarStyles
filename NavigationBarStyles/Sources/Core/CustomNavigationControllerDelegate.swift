//
//  CustomNavigationControllerDelegate.swift
//  NavigationBarStyles
//
//  Created by Anatoliy Radchenko on 19/06/2017.
//  Copyright © 2017 NavigationBarStyles. All rights reserved.
//

import Foundation
import UIKit

class CustomNavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              willShow viewController: UIViewController, animated: Bool) {
        guard let configurable = viewController as? NavigationBarConfigurable else {
            return
        }
        
        let configuration = configurable.preferredNavigationBarConfiguration
        let oldStyle = navigationController.customNavigationBar.style
        let newStyle = configuration.barStyle
        
        if let new = newStyle, let old = oldStyle, new.identifier != old.identifier {
            navigationController.customNavigationBar.style = newStyle
        } else if navigationController.customNavigationBar.style == nil,
            let newStyle = configuration.barStyle {
            navigationController.customNavigationBar.style = newStyle
        }
        
        navigationController.setNavigationBarHidden(configuration.isHidden, animated: animated)
    }
}
