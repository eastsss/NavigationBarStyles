//
//  String+Size.swift
//  SwiftyUtilities
//
//  Created by Anatoliy Radchenko on 02/06/2017.
//  Copyright © 2017 SwiftyUtilities. All rights reserved.
//

import UIKit

extension String {
    public func size(with font: UIFont, constrainedToWidth width: CGFloat) -> CGSize {
        let attrString = NSAttributedString(
            string: self,
            attributes: [
                NSFontAttributeName: font
            ]
        )
        
        let sizeConstraint = CGSize(width: width, height: .greatestFiniteMagnitude)
        
        let framesetter = CTFramesetterCreateWithAttributedString(attrString)
        return CTFramesetterSuggestFrameSizeWithConstraints(
            framesetter,
            CFRange(location: 0, length: 0),
            nil,
            sizeConstraint,
            nil
        )
    }
}
