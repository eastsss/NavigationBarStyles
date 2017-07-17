//
//  Navigation.swift
//  NavigationBarStyles
//
//  Created by Anatoliy Radchenko on 19/06/2017.
//  Copyright © 2017 NavigationBarStyles. All rights reserved.
//

import UIKit

final public class Navigation {
    private static let globalDelegate = CustomNavigationControllerDelegate()
    
    static public func wrapped(_ controller: NavigationBarConfigurableController) -> CustomNavigationController {
        return wrapped([controller])
    }
    
    static public func wrapped(_ controllers: [NavigationBarConfigurableController]) -> CustomNavigationController {
        let nc = CustomNavigationController(navigationBarClass: CustomNavigationBar.self, toolbarClass: nil)
        
        nc.setViewControllers(controllers, animated: false)
        
        guard let lastController = controllers.last else {
            fatalError("Custom navigation controller must contain at least 1 view controller")
        }
        
        let config = lastController.preferredNavigationBarConfiguration
        
        nc.customNavigationBar.style = config.barStyle
        nc.setNavigationBarHidden(config.isHidden, animated: false)
        nc.delegate = globalDelegate
        
        return nc
    }
}
