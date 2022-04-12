//
//  MainViewModel.swift
//  YuGiOh
//
//  Created by Evgeniy Petlitskiy on 11.04.22.
//

import Foundation

enum CardType: Int, CaseIterable {
    case all
    case monster
    case spell
    case trap
    
    var name: String {
        switch self {
        case .all: return "All"
        case .monster: return "Monster"
        case .spell: return "Spell"
        case .trap: return "Trap"
        }
    }
}

final class MainViewModel: MainViewModelling, MainViewModuleOutput {
    
    weak var view: MainViewInput?
    
    // MARK: - Private properties
    
    private let cardService: CardService
    
    private var state: ViewState {
        didSet {
            self.view?.didUpdate(with: state)
        }
    }
    
    private var cards = [Card]()
    private var filteredCards = [Card]()
    private var selectedType: CardType = .all {
        didSet {
            filterCards()
        }
    }
    
    // MARK: - Initialization and deinitialization
    
    init(cardService: CardService) {
        self.cardService = cardService
        state = .idle
    }
}

// MARK: - Data Source

extension MainViewModel {
    
    var numberOfItems: Int {
        filteredCards.count
    }
    
    func getCardInfo(for indexPath: IndexPath) -> CardInfo {
        let card = filteredCards[indexPath.row]
        return CardInfo(card: card)
    }
}

// MARK: - Card Service

extension MainViewModel {
    
    func loadCards() {
        state = .loading
        cardService.getAllCards { result in
            switch result {
            case .success(let cards):
                self.cards = cards
                self.filteredCards = cards
                self.state = .success
            case .failure(let error):
                self.cards = []
                self.filteredCards = []
                self.state = .error(error)
            }
        }
    }
}

// MARK: - Filtering methods

extension MainViewModel {
    
    func filterBy(type: CardType) {
        self.selectedType = type
    }
    
    private func filterCards() {
        switch selectedType {
        case .all:
            filteredCards = cards
        case .monster:
            filteredCards = cards.filter { $0.type.contains(CardType.monster.name) }
        case .spell:
            filteredCards = cards.filter { $0.type.contains(CardType.spell.name) }
        case .trap:
            filteredCards = cards.filter { $0.type.contains(CardType.trap.name) }
        }
        state = .success
    }
}
