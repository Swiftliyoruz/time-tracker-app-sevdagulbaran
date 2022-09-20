//
//  Color+Extension.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 13.09.2022.
//

import UIKit

extension UIColor {
    
    class func rgb(fromHex: Int) -> UIColor {
        
        let red =   CGFloat((fromHex & 0xFF0000) >> 16) / 0xFF
        let green = CGFloat((fromHex & 0x00FF00) >> 8) / 0xFF
        let blue =  CGFloat(fromHex & 0x0000FF) / 0xFF
        let alpha = CGFloat(1.0)
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    class var customPink: UIColor {
        .rgb(fromHex: 0xFD5B71)
    }
    class var lightBackground: UIColor {
        .rgb(fromHex: 0xE5E5E5)
    }
    class var lightGray: UIColor {
        .rgb(fromHex: 0xFAFAFF)
    }
    class var blackBackground: UIColor {
        rgb(fromHex: 0x070417)
    }
    class var grey2: UIColor {
        rgb(fromHex: 0x4F4F4F)
    }
}
