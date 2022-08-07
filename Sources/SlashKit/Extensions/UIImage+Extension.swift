//
//  UIImage+Extension.swift
//  Weather
//
//  Created by Cameron Slash on 22/3/22.
//

import Foundation
import SwiftUI

#if canImport(UIKit)
extension UIImage {
    public func getPixelColor(pos: CGPoint) -> Color {
        let pixelData = self.cgImage!.dataProvider!.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
        
        let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo + 1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo + 2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo + 3]) / CGFloat(255.0)
        
        return Color(red: r, green: g, blue: b, opacity: a)
    }
}
#endif
