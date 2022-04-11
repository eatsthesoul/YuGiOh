//
//  CardService.swift
//  YuGiOh
//
//  Created by Evgeniy Petlitskiy on 11.04.22.
//

import Foundation

final class CardService {
    
    private enum ApiURL {
        case base
        case db
        
        var url: String {
            switch self {
            case .base: return "https://ygoprodeck.com"
            case .db: return "https://db.ygoprodeck.com/api/v7"
            }
        }
    }
    
    private enum EndPoint {
        case cardList
        
        var path: String {
            switch self {
            case .cardList:
                return "/cardinfo.php"
            }
        }
        
        var url: String {
            switch self {
            case .cardList:
                return "\(ApiURL.db.url)\(path)"
            }
        }
    }
    
    func getAllCards(completion: @escaping (Result<[Card], Error>) -> ()) {
        
        guard Reachability.isConnectedToNetwork(),
              let url = URL(string: EndPoint.cardList.url)
        else {
            completion(.failure(CustomError.noConnection))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(CustomError.noData))
                return
            }
            
            do {
                let cards = try JSONDecoder().decode(CardResponse.self, from: data)
                completion(.success(cards.data))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }
}
