//
//  Color+Extension.swift
//  Carousel
//
//  Created by Cameron Slash on 23/12/21.
//

import Foundation
import SwiftUI

#if canImport(UIKit)
extension UIColor {
    public func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0

        getRed(&r, green: &g, blue: &b, alpha: &a)

        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0

        return String(format:"#%06x", rgb)
    }
    
    public convenience init(hexString: String) {
      let hexString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
      let scanner = Scanner(string: hexString)
      scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")

      var color: UInt64 = 0

      if scanner.scanHexInt64(&color) {
        self.init(hex: color, useAlpha: hexString.count > 7)
      }
      else {
        self.init(hex: 0x000000)
      }
    }
    
    public convenience init(hex: UInt64, useAlpha alphaChannel: Bool = false) {
      let mask      = UInt64(0xFF)
      let cappedHex = !alphaChannel && hex > 0xffffff ? 0xffffff : hex

      let r = cappedHex >> (alphaChannel ? 24 : 16) & mask
      let g = cappedHex >> (alphaChannel ? 16 : 8) & mask
      let b = cappedHex >> (alphaChannel ? 8 : 0) & mask
      let a = alphaChannel ? cappedHex & mask : 255

      let red   = CGFloat(r) / 255.0
      let green = CGFloat(g) / 255.0
      let blue  = CGFloat(b) / 255.0
      let alpha = CGFloat(a) / 255.0

      self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
#endif
