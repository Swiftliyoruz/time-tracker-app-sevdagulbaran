//
//  Font+Extension.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 13.09.2022.
//

import UIKit


extension UIFont {
    
    static func appFont(size: CGFloat, type:String) -> UIFont
    {
        return UIFont(name: type, size: size)!
    }
    
    static let title = appFont(size: 24, type: "Rubik-Medium")
    static let timeTitle = appFont(size: 32, type: "Rubik-Medium")
    static let cardDesc = appFont(size: 16, type: "Rubik-Regular")
    
}
