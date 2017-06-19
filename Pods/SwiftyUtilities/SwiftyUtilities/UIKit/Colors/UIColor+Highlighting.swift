//
//  UIColor+Highlighting.swift
//  SwiftyUtilities
//
//  Created by Anatoliy Radchenko on 05/06/2017.
//  Copyright © 2017 SwiftyUtilities. All rights reserved.
//

import UIKit

public extension UIColor {
    public var highlighted: UIColor {
        return highlightedByMasking() ?? scaledComponentwiseHighlighted()
    }
}

extension UIColor {
    public func highlightedByMasking() -> UIColor? {
        
        let maskColor = UIColor(white: 0, alpha: 0.46)
        let originalColor = self
        
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        var pixelData: [UInt8] = [0, 0, 0, 0]
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        guard let context = CGContext(data: &pixelData, width: 1, height: 1,
                                      bitsPerComponent: 8, bytesPerRow: 4,
                                      space: colorSpace, bitmapInfo: bitmapInfo.rawValue) else {
            return nil
        }
        
        context.setFillColor(originalColor.cgColor)
        context.fill(rect)
        context.setFillColor(maskColor.cgColor)
        context.fill(rect)
        
        let red = pixelData[0]
        let green = pixelData[1]
        let blue = pixelData[2]
        let alpha = CGFloat(pixelData[3]) / CGFloat(255.0)
        
        return UIColor(r: red,
                       g: green,
                       b: blue,
                       alpha:alpha)
    }
}

extension UIColor {
    public func scaledComponentwise(by scaleFactor: CGFloat) -> UIColor {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        var resultColor: UIColor = self
        
        guard let colorSpace = cgColor.colorSpace else {
            return resultColor
        }
        
        let colorSpaceModel = colorSpace.model
        
        guard let colorComponents = cgColor.components else {
            return resultColor
        }
        
        let colorComponentsCount = cgColor.numberOfComponents
        
        switch colorSpaceModel {
        case .monochrome:
            if colorComponentsCount == 2 {
                red = colorComponents[0]
                green = colorComponents[0]
                blue = colorComponents[0]
                alpha = colorComponents[1]
                
                resultColor = UIColor(red: red * scaleFactor,
                                      green: green * scaleFactor,
                                      blue: blue * scaleFactor,
                                      alpha: alpha)
            }
        case .rgb:
            if colorComponentsCount == 4 {
                red = colorComponents[0]
                green = colorComponents[1]
                blue = colorComponents[2]
                alpha = colorComponents[3]
                
                resultColor = UIColor(red: red * scaleFactor,
                                      green: green * scaleFactor,
                                      blue: blue * scaleFactor,
                                      alpha: alpha)
            }
        default:
            break
        }
        
        return resultColor
    }
    
    public func scaledComponentwiseHighlighted() -> UIColor {
        return scaledComponentwise(by: 0.53)
    }
}
