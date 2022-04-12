//
//  UIColor.swift
//  YuGiOh
//
//  Created by Evgeniy Petlitskiy on 12.04.22.
//

import UIKit

extension UIColor {
    
    static func color(for cardType: String) -> UIColor {

        let type = cardType.lowercased()
        
        if type.contains("monster") {
            return .brown
        } else if type.contains("spell") {
            return .systemTeal
        } else if type.contains("trap") {
            return .systemPink
        } else {
            return .blue
        }
    }
}
