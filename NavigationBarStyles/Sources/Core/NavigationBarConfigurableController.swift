//
//  NavigationBarConfigurableController.swift
//  NavigationBarStyles
//
//  Created by Anatoliy Radchenko on 19/06/2017.
//  Copyright © 2017 NavigationBarStyles. All rights reserved.
//

import UIKit

open class NavigationBarConfigurableController: UIViewController, NavigationBarConfigurable {
    open var preferredNavigationBarConfiguration: NavigationBarConfiguration {
        return .hidden
    }
    
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    open var leftBarButtonItems: [BarButtonItem] {
        return []
    }
    
    open var rightBarButtonItems: [BarButtonItem] {
        return []
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        
        navigationItem.setHidesBackButton(true, animated: false)
        
        setLeftBarButtonItems(leftBarButtonItems.map({ $0.uiBarButtonItem }))
        setRightBarButtonItems(rightBarButtonItems.map({ $0.uiBarButtonItem }))
    }
}

// MARK: Navigation bar items management
private extension NavigationBarConfigurableController {
    func setLeftBarButtonItems(_ items: [UIBarButtonItem], leftOffset: CGFloat = -6) {
        guard !items.isEmpty else {
            navigationItem.leftBarButtonItems = nil
            return
        }
        
        let offsetItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        offsetItem.width = leftOffset
        var tempItems = items
        tempItems.insert(offsetItem, at: 0)
        navigationItem.leftBarButtonItems = tempItems
    }
    
    func setRightBarButtonItems(_ items: [UIBarButtonItem], rightOffset: CGFloat = -6) {
        guard !items.isEmpty else {
            navigationItem.rightBarButtonItems = nil
            return
        }
        
        let offsetItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        offsetItem.width = rightOffset
        var tempItems = items
        tempItems.insert(offsetItem, at: 0)
        navigationItem.rightBarButtonItems = tempItems
    }
}
