//
//  NavigationBarConfiguration.swift
//  NavigationBarStyles
//
//  Created by Anatoliy Radchenko on 19/06/2017.
//  Copyright © 2017 NavigationBarStyles. All rights reserved.
//

import UIKit

public enum NavigationBarConfiguration {
    case hidden
    case visible(NavigationBarStyle)
    
    var barStyle: NavigationBarStyle? {
        switch self {
        case .hidden:
            return nil
        case .visible(let style):
            return style
        }
    }
    
    var isHidden: Bool {
        switch self {
        case .hidden:
            return true
        case .visible:
            return false
        }
    }
}
