//
//  UIColor+.swift
//  GO-SOPT-TVING
//
//  Created by 김사랑 on 2023/04/21.
//

import UIKit

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }

        if hexString.count != 6 {
            self.init(red: 0, green: 0, blue: 0, alpha: alpha)
            return
        }

        guard let rgbValue = UInt64(hexString, radix: 16) else {
            self.init(red: 0, green: 0, blue: 0, alpha: alpha)
            return
        }

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}

extension UIColor {
    
    class var mainRed: UIColor {
        return UIColor(hex: "FF143C")
    }
    
    class var textGrey4: UIColor {
        return UIColor(hex: "2E2E2E")
    }
    class var textGrey3: UIColor {
        return UIColor(hex: "626262")
    }
    class var textGrey2: UIColor {
        return UIColor(hex: "9C9C9C")
    }
    class var textGrey1: UIColor {
        return UIColor(hex: "D6D6D6")
    }
    class var back19: UIColor {
        return UIColor(hex: "191919")
    }

}
