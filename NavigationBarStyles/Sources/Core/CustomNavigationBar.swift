//
//  CustomNavigationBar.swift
//  NavigationBarStyles
//
//  Created by Anatoliy Radchenko on 19/06/2017.
//  Copyright © 2017 NavigationBarStyles. All rights reserved.
//

import UIKit

open class CustomNavigationBar: UINavigationBar {
    public var style: NavigationBarStyle? {
        didSet {
            guard let validStyle = style else {
                return
            }
            
            customize(with: validStyle)
        }
    }
}

public extension UINavigationController {
    var customNavigationBar: CustomNavigationBar {
        guard let customBar = navigationBar as? CustomNavigationBar else {
            fatalError("Wrapping using Navigation.wrapped() is required to use customNavigationBar property.")
        }
        
        return customBar
    }
}

// MARK: Private supporting methods
private extension CustomNavigationBar {
    func customize(with style: NavigationBarStyle) {
        setBackgroundImage(style.backgroundImage, for: .default)
        backgroundColor = style.backgroundColor
        shadowImage = style.shadowImage
        isTranslucent = style.translucent
        titleTextAttributes = style.titleTextAttributes
        tintColor = style.tintColor
        setTitleVerticalPositionAdjustment(-2, for: .default)
    }
}
