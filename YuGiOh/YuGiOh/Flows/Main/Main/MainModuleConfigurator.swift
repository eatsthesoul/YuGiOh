//
//  MainModuleConfigurator.swift
//  YuGiOh
//
//  Created by Evgeniy Petlitskiy on 11.04.22.
//

import Foundation

final class MainModuleConfigurator {
    
    
    func configure() -> (MainViewController) {
        let view = MainViewController(nibName: nil, bundle: nil)
        
        let cardService = CardService()
        let viewModel = MainViewModel(cardService: cardService)
        
        view.viewModel = viewModel
        viewModel.view = view
        
        return (view)
    }
}
