//
//  UIColor+Hex.swift
//  Racing
//
//  Created by Евгений  Гравдин  on 11/04/2021.
//

import UIKit

extension UIColor {
    convenience init(hex: Int) {
        let red = (hex & 0xFF0000) >> 16
        let green = (hex & 0x00FF00) >> 8
        let blue = 0x0000FF

        self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: 1.0)
    }
}
