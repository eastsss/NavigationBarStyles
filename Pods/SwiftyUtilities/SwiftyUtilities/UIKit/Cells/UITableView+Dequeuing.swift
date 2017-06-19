//
//  UITableView+Dequeuing.swift
//  SwiftyUtilities
//
//  Created by Anatoliy Radchenko on 02/06/2017.
//  Copyright © 2017 SwiftyUtilities. All rights reserved.
//

import UIKit

public extension UITableView {
    func registerNib<T: UITableViewCell>(for cellClass: T.Type) where T: ReuseIdentifiable, T: NibCompatible {
        register(cellClass.nib(), forCellReuseIdentifier: cellClass.reuseIdentifier())
    }
    
    func registerCell<T: UITableViewCell>(_ cellClass: T.Type) where T: ReuseIdentifiable {
        register(cellClass, forCellReuseIdentifier: cellClass.reuseIdentifier())
    }
    
    func registerNibForHeaderFooterView<T: UITableViewHeaderFooterView>(_ viewClass: T.Type)
        where T: ReuseIdentifiable, T: NibCompatible {
            register(viewClass.nib(), forHeaderFooterViewReuseIdentifier: viewClass.reuseIdentifier())
    }
    
    func registerHeaderFooterView<T: UITableViewHeaderFooterView>(_ viewClass: T.Type)
        where T: ReuseIdentifiable {
            register(viewClass, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier())
    }
    
    func dequeueCell<T: UITableViewCell>(_ cellClass: T.Type, forIndexPath indexPath: IndexPath) -> T
        where T: ReuseIdentifiable {
            guard let cell = dequeueReusableCell(withIdentifier: cellClass.reuseIdentifier(), for: indexPath) as? T else {
                fatalError("Error: cell with identifier: \(cellClass.reuseIdentifier()) for index path: \(indexPath) is not \(T.self)")
            }
            
            return cell
    }
    
    func dequeueHeaderFooterView<T: UITableViewHeaderFooterView>(_ viewClass: T.Type) -> T? where T: ReuseIdentifiable {
        return dequeueReusableHeaderFooterView(withIdentifier: viewClass.reuseIdentifier()) as? T
    }
}
