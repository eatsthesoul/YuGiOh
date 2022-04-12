//
//  MainViewModelling.swift
//  YuGiOh
//
//  Created by Evgeniy Petlitskiy on 11.04.22.
//

import Foundation

protocol MainViewModelling {
    
    //data loading
    func loadCards()
    
    //data source
    var numberOfItems: Int { get }
    func getCardInfo(for indexPath: IndexPath) -> CardInfo
    
    //filtering
    func filterBy(type: CardType)
}
