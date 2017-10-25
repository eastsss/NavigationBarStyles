//
//  BarButtonItem.swift
//  NavigationBarStyles
//
//  Created by Anatoliy Radchenko on 19/06/2017.
//  Copyright © 2017 NavigationBarStyles. All rights reserved.
//

import UIKit

public protocol BarButtonItem {
    var uiBarButtonItem: UIBarButtonItem { get }
}

public protocol NavigationBarConfigurable {
    var preferredNavigationBarConfiguration: NavigationBarConfiguration { get }
}

public protocol NavigationBarStyle {
    var translucent: Bool { get }
    var backgroundImage: UIImage? { get }
    var backgroundColor: UIColor { get }
    var shadowImage: UIImage? { get }
    var titleTextAttributes: [String: Any]? { get }
    var tintColor: UIColor? { get }
    var titleVerticalPositionAdjustment: CGFloat { get }
}

extension NavigationBarStyle {
    public var titleVerticalPositionAdjustment: CGFloat {
        return -2
    }
}
