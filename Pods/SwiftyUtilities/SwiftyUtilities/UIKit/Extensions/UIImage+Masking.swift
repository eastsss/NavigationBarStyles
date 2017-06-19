//
//  UIImage+Masking.swift
//  SwiftyUtilities
//
//  Created by Anatoliy Radchenko on 02/06/2017.
//  Copyright © 2017 SwiftyUtilities. All rights reserved.
//

import UIKit

extension UIImage {
    public func mask(with image: UIImage) -> UIImage? {
        guard let imageRef = cgImage else {
            return nil
        }
        
        guard let maskRef = image.cgImage else {
            return nil
        }
        
        guard let provider = maskRef.dataProvider else {
            return nil
        }
        
        let imageMask = CGImage(
            maskWidth: maskRef.width,
            height: maskRef.height,
            bitsPerComponent: maskRef.bitsPerComponent,
            bitsPerPixel: maskRef.bitsPerPixel,
            bytesPerRow: maskRef.bytesPerRow,
            provider: provider,
            decode: nil,
            shouldInterpolate: false
        )
        
        guard let validImageMask = imageMask else {
            return nil
        }
        
        guard let maskedRef = imageRef.masking(validImageMask) else {
            return nil
        }
        
        return UIImage(cgImage: maskedRef)
    }
}
