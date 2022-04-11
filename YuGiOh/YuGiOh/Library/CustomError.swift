//
//  CustomError.swift
//  YuGiOh
//
//  Created by Evgeniy Petlitskiy on 11.04.22.
//

import Foundation

enum CustomError {
    case noConnection, noData
}

extension CustomError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .noData: return "Well, weird thing happens"
        case .noConnection: return "No Internet Connection"
        }
    }
}
