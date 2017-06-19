//
//  UIColor+Initializers.swift
//  SwiftyUtilities
//
//  Created by Anatoliy Radchenko on 05/06/2017.
//  Copyright © 2017 SwiftyUtilities. All rights reserved.
//

import UIKit

extension UIColor {
    // swiftlint:disable:next identifier_name
    public convenience init(r: UInt8, g: UInt8, b: UInt8, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(r) / 255.0,
                  green: CGFloat(g) / 255.0,
                  blue: CGFloat(b) / 255.0,
                  alpha: alpha)
    }
    
    public convenience init(whiteComponent: UInt8, alpha: CGFloat = 1.0) {
        self.init(white: CGFloat(whiteComponent) / 255.0, alpha:alpha)
    }
    
    public convenience init(hexFormat: UInt, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(((hexFormat & 0xFF0000) >> 16)) / 255.0,
                  green: CGFloat(((hexFormat & 0xFF00) >> 8)) / 255.0,
                  blue: CGFloat((hexFormat & 0xFF)) / 255.0,
                  alpha: alpha)
    }
}
