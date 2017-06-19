//
//  NibLoader.swift
//  SwiftyUtilities
//
//  Created by Anatoliy Radchenko on 02/06/2017.
//  Copyright © 2017 SwiftyUtilities. All rights reserved.
//

import UIKit

public class NibLoader {
    public static func load<T: UIView>(
        _ type: T.Type,
        addAsSubviewTo view: UIView,
        fileOwner: AnyObject? = nil,
        useAutoLayout: Bool = true) -> UIView? {
        var owner = fileOwner
        if owner == nil {
            owner = view
        }
        
        let nib = self.nib(forType: type)
        
        guard let loadedView = self.view(fromNib: nib, nibFileOwner: owner) else {
            return nil
        }
        
        view.addSubview(loadedView)
        if useAutoLayout {
            view.attachSubviewUsingConstraints(subview: loadedView)
        } else {
            loadedView.frame = view.bounds
            loadedView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
        
        return loadedView
    }
    
    public static func nib(forType type: Swift.AnyClass) -> UINib {
        let nibName = self.nibName(forType: type)
        let bundle = Bundle(for: type)
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib
    }
}

// MARK: Supporting methods
private extension NibLoader {
    static func nibName(forType type: Swift.AnyClass) -> String {
        let fullTypeName = NSStringFromClass(type)
        
        let nameComponents = fullTypeName.components(separatedBy: ".")
        if let lastNameComponent = nameComponents.last {
            return lastNameComponent
        } else {
            return fullTypeName
        }
    }
    
    static func view(fromNib nib: UINib, nibFileOwner: AnyObject?) -> UIView? {
        let instantiatedView = nib.instantiate(withOwner: nibFileOwner, options: nil).first as? UIView
        
        return instantiatedView
    }
}
