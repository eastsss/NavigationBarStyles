//
//  BarButtonItemConfigurations.swift
//  NavigationBarStyles
//
//  Created by Anatoliy Radchenko on 17/07/2017.
//  Copyright © 2017 NavigationBarStyles. All rights reserved.
//

import UIKit

public enum ButtonSideSizingPolicy {
    case contentBased
    case fixed(CGFloat)
}

public struct SpinnerParams {
    public let color: UIColor
    public let isLarge: Bool
    
    public init(color: UIColor = UIColor.gray, isLarge: Bool = false) {
        self.color = color
        self.isLarge = isLarge
    }
}

public struct ImageButtonParams {
    public let normalImage: UIImage
    public let highlightedImage: UIImage?
    public let widthPolicy: ButtonSideSizingPolicy
    public let spinnerParams: SpinnerParams?
    public let target: AnyObject?
    public let action: Selector
    
    public init(normalImage: UIImage,
                highlightedImage: UIImage? = nil,
                widthPolicy: ButtonSideSizingPolicy = .contentBased,
                spinnerParams: SpinnerParams? = nil,
                target: AnyObject?,
                action: Selector) {
        self.normalImage = normalImage
        self.highlightedImage = highlightedImage
        self.widthPolicy = widthPolicy
        self.spinnerParams = spinnerParams
        self.target = target
        self.action = action
    }
}

public struct TextButtonParams {
    public let title: String
    public let titleColor: UIColor
    public let titleFont: UIFont
    public let backgroundColor: UIColor
    public let contentEdgeInsets: UIEdgeInsets
    public let cornerRadius: CGFloat
    public let heightPolicy: ButtonSideSizingPolicy
    public let spinnerParams: SpinnerParams?
    public let target: AnyObject?
    public let action: Selector
    
    public init(title: String,
                titleColor: UIColor,
                titleFont: UIFont,
                backgroundColor: UIColor,
                contentEdgeInsets: UIEdgeInsets = .zero,
                cornerRadius: CGFloat = 0,
                heightPolicy: ButtonSideSizingPolicy = .contentBased,
                spinnerParams: SpinnerParams? = nil,
                target: AnyObject?,
                action: Selector) {
        self.title = title
        self.titleColor = titleColor
        self.titleFont = titleFont
        self.backgroundColor = backgroundColor
        self.contentEdgeInsets = contentEdgeInsets
        self.cornerRadius = cornerRadius
        self.heightPolicy = heightPolicy
        self.spinnerParams = spinnerParams
        self.target = target
        self.action = action
    }
}

