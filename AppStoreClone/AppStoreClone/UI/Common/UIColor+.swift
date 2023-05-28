//
//  UIColor+.swift
//  AppStoreClone
//
//  Created by SeYeong on 2023/05/28.
//

import UIKit

extension UIColor {
    static func color(light: UIColor, dark: UIColor) -> UIColor {
        var isDarkMode: Bool {
            switch UIScreen.main.traitCollection.userInterfaceStyle {
            case .light:
                return false
            case .dark:
                return true
            default:
                return false
            }
        }

        return UIColor { (traitCollection: UITraitCollection) -> UIColor in
            print("IsDarkMode: \(isDarkMode)")
            return isDarkMode ? dark : white
        }
    }

    static var backgroundColorLight: UIColor {
        return UIColor(white: 244/255, alpha: 1.0)
    }

    static var backgroundColorDark: UIColor {
        return .black
    }
}
