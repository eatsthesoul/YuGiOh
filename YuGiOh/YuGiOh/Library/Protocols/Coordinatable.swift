//
//  Coordinatable.swift
//  YuGiOh
//
//  Created by Evgeniy Petlitskiy on 8.04.22.
//

import Foundation

/// Base protocol for coordinator
protocol Coordinatable: AnyObject {
    /// Notifies coordinator that it can start itself
    func start()
    /// Notifies coordinator that it should start itself with deeplink option
    ///
    /// - parameter deepLinkOption: deeplink option such as Dynamic Link, push-notification, etc.
    func start(with deepLinkOption: DeepLinkOption?)
}
