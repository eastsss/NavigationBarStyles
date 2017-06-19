//
//  UIView+Pinning.swift
//  SwiftyUtilities
//
//  Created by Anatoliy Radchenko on 02/06/2017.
//  Copyright © 2017 SwiftyUtilities. All rights reserved.
//

import UIKit

extension UIView {
    public func attachSubviewUsingConstraints(subview: UIView) {
        assert(subview.superview == self, "superview of \(subview) has to be equal to \(self)")
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|",
                                                      options: NSLayoutFormatOptions.directionLeadingToTrailing,
                                                      metrics: nil,
                                                      views: ["view": subview]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|",
                                                      options: NSLayoutFormatOptions.directionLeadingToTrailing,
                                                      metrics: nil,
                                                      views: ["view": subview]))
    }
}
