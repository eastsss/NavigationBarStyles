//
//  UICollectionView+Dequeuing.swift
//  SwiftyUtilities
//
//  Created by Anatoliy Radchenko on 02/06/2017.
//  Copyright © 2017 SwiftyUtilities. All rights reserved.
//

import UIKit

public extension UICollectionView {
    public func registerNib<T: UICollectionViewCell>(for cellClass: T.Type) where T: ReuseIdentifiable, T: NibCompatible {
        register(cellClass.nib(), forCellWithReuseIdentifier: cellClass.reuseIdentifier())
    }
    
    public func registerCell<T: UICollectionViewCell>(_ cellClass: T.Type) where T: ReuseIdentifiable {
        register(cellClass, forCellWithReuseIdentifier: cellClass.reuseIdentifier())
    }
    
    public func registerNibForSupplementaryView<T: UICollectionReusableView>(_ viewClass: T.Type, viewKind: String)
        where T: ReuseIdentifiable, T: NibCompatible {
            register(viewClass.nib(), forSupplementaryViewOfKind: viewKind, withReuseIdentifier: T.reuseIdentifier())
    }
    
    public func registerSupplementaryView<T: UICollectionReusableView>(_ viewClass: T.Type, viewKind: String)
        where T: ReuseIdentifiable {
            register(viewClass, forSupplementaryViewOfKind: viewKind, withReuseIdentifier: T.reuseIdentifier())
    }
    
    public func dequeueCell<T: UICollectionViewCell>(_ cellClass: T.Type, forIndexPath indexPath: IndexPath) -> T
        where T: ReuseIdentifiable {
            guard let cell = dequeueReusableCell(withReuseIdentifier: cellClass.reuseIdentifier(), for: indexPath) as? T else {
                fatalError("Error: cell with identifier: \(cellClass.reuseIdentifier()) for index path: \(indexPath) is not \(T.self)")
            }
            
            return cell
    }
    
    public func dequeueSupplementaryView<T: UICollectionReusableView>(
        _ viewClass: T.Type,
        viewKind: String,
        forIndexPath indexPath: IndexPath) -> T where T: ReuseIdentifiable {
        guard let view = dequeueReusableSupplementaryView(ofKind: viewKind,
                                                          withReuseIdentifier: viewClass.reuseIdentifier(),
                                                          for: indexPath) as? T else {
            fatalError("Error: view with identifier: \(viewClass.reuseIdentifier()) for index path: \(indexPath) is not \(T.self)")
        }
        
        return view
    }
}
