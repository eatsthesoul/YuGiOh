//
//  Routable.swift
//  YuGiOh
//
//  Created by Evgeniy Petlitskiy on 8.04.22.
//

import Foundation

/// Describes object that handles all navigation operations
protocol Routable {
    func present(_ module: Presentable?)
    func present(_ module: Presentable?, animated: Bool, completion: (() -> Void)?)

    func push(_ module: Presentable?)
    func push(_ module: Presentable?, animated: Bool)

    func popModule()
    func popModule(animated: Bool)
    func popPreviousView()

    func dismissModule()
    func dismissModule(animated: Bool, completion: (() -> Void)?)

    func setNavigationControllerRootModule(_ module: Presentable?, animated: Bool, hideBar: Bool)
    func setRootModule(_ module: Presentable?)

    func setTab(_ index: Int)
}
