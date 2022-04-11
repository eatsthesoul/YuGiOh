//
//  Presentable.swift
//  YuGiOh
//
//  Created by Evgeniy Petlitskiy on 8.04.22.
//

import UIKit

/// Describes object that can be presented in view hierarchy
protocol Presentable {
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {

    func toPresent() -> UIViewController? {
        return self
    }

}
