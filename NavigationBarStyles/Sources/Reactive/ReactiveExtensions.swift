//
//  ReactiveExtensions.swift
//  NavigationBarStyles
//
//  Created by Anatoliy Radchenko on 17/07/2017.
//  Copyright © 2017 NavigationBarStyles. All rights reserved.
//

import ReactiveSwift
import ReactiveCocoa

extension Reactive where Base: UIBarButtonItem {
    var buttonLoading: BindingTarget<Bool> {
        return makeBindingTarget { $0.setActivityIndicator(animating: $1) }
    }
    
    var buttonEnabled: BindingTarget<Bool> {
        return makeBindingTarget { $0.setButton(enabled: $1) }
    }
    
    var buttonSelected: BindingTarget<Bool> {
        return makeBindingTarget { $0.setButton(selected: $1) }
    }
}
