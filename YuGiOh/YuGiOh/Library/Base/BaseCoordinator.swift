//
//  BaseCoordinator.swift
//  YuGiOh
//
//  Created by Evgeniy Petlitskiy on 8.04.22.
//

import Foundation

/// Provides base realisation of coordinator's methods
/// Subclass from this base class for making new flow coordinator
class BaseCoordinator: Coordinatable {

    // MARK: - Properties
    var childCoordinators: [Coordinatable] = []

    // MARK: - Internal Methods
    func start() {
        start(with: nil)
    }

    func start(with deepLinkOption: DeepLinkOption?) { }

    // add only unique object
    func addDependency(_ coordinator: Coordinatable) {
        guard !haveDependency(coordinator) else {
            return
        }
        childCoordinators.append(coordinator)
    }

    func removeDependency(_ coordinator: Coordinatable?) {
        guard
            !childCoordinators.isEmpty,
            let coordinator = coordinator
            else { return }

        for (index, element) in childCoordinators.enumerated() {
            if element === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }

    // MARK: - Private Methods
    private func haveDependency(_ coordinator: Coordinatable) -> Bool {
        for element in childCoordinators {
            if element === coordinator {
                return true
            }
        }
        return false
    }

}
