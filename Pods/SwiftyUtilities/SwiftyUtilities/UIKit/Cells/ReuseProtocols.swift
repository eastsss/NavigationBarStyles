//
//  NibCompatible.swift
//  SwiftyUtilities
//
//  Created by Anatoliy Radchenko on 02/06/2017.
//  Copyright © 2017 SwiftyUtilities. All rights reserved.
//

import UIKit

public protocol ReuseIdentifiable: class {
    static func reuseIdentifier() -> String
}

public extension ReuseIdentifiable {
    static func reuseIdentifier() -> String {
        return NSStringFromClass(self)
    }
}

public protocol NibCompatible: class {
    static func nib() -> UINib
}

public extension NibCompatible {
    public static func nib() -> UINib {
        return NibLoader.nib(forType: self)
    }
}

public typealias NibReusable = NibCompatible & ReuseIdentifiable
