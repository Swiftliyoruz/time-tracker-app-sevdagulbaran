//
//  Color+Extension.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 13.09.2022.
//

import Foundation
import UIKit


import UIKit

extension UIColor {

    class var pink: UIColor {
        let const = 0xFD5B71
        return UIColor.rgb(fromHex: const)
    }
    class var lightBackground: UIColor {
        let const = 0xE5E5E5
        return UIColor.rgb(fromHex: const)
    }
    class var lightGray: UIColor {
        let const = 0xFAFAFF
        return UIColor.rgb(fromHex: const)
    }
    class var blackBackground: UIColor {
        let const = 0x070417
        return UIColor.rgb(fromHex: const)
    }

    class func rgb(fromHex: Int) -> UIColor {

        let red =   CGFloat((fromHex & 0xFF0000) >> 16) / 0xFF
        let green = CGFloat((fromHex & 0x00FF00) >> 8) / 0xFF
        let blue =  CGFloat(fromHex & 0x0000FF) / 0xFF
        let alpha = CGFloat(1.0)

        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
