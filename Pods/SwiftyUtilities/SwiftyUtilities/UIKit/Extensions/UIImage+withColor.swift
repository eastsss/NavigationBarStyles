//
//  UIImage+withColor.swift
//  SwiftyUtilities
//
//  Created by Anatoliy Radchenko on 05/06/2017.
//  Copyright © 2017 SwiftyUtilities. All rights reserved.
//

public extension UIImage {
    static func withColor(_ color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), false, 0)
        color.setFill()
        UIRectFill(rect)
        // swiftlint:disable:next force_unwrapping
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
