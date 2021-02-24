//
//  Color.swift
//  PDKit
//
//  Created by deng on 2021/2/24.
//

import UIKit

public enum Color {
    public static var green  = color(light: 0x36b59d, dark: 0x36b59d)
    public static var red    = color(light: 0xdc663e, dark: 0xdc663e)
    public static var yellow = color(light: 0xEB9E27, dark: 0xEB9E27)
    
    public static func color(light: Int, dark: Int) -> UIColor {
        .init { traitCollection -> UIColor in
            if traitCollection.userInterfaceStyle == .light {
                return light.color
            } else {
                return dark.color
            }
        }
    }
}

extension UIColor {
    public static var random: UIColor {
        UIColor(red: .random(in: 0...1),
                green: .random(in: 0...1),
                blue: .random(in: 0...1),
                alpha: 1.0)
    }
}

extension CGColor {
    public static var random: CGColor { UIColor.random.cgColor }
}

extension Int {
    var color: UIColor {
        .init(
            red: CGFloat((self & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((self & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(self & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

extension UInt {
    var color: UIColor {
        .init(
            red: CGFloat((self & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((self & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(self & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
