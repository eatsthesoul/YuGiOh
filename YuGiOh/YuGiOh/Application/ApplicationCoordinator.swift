//
//  ApplicationCoordinator.swift
//  YuGiOh
//
//  Created by Evgeniy Petlitskiy on 11.04.22.
//

import Foundation

final class ApplicationCoordinator: BaseCoordinator {
    
    // MARK: - Private properties

    private(set) var router = Router()

    // MARK: - Coordinator

    override func start() {
        super.start()
        runMainFlow()
    }
}

// MARK: - Private Methods

private extension ApplicationCoordinator {

    func runMainFlow() {
        let coordinator = MainCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.start()
            self?.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }
}
