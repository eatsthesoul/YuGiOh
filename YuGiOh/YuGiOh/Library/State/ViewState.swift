//
//  ViewState.swift
//  YuGiOh
//
//  Created by Evgeniy Petlitskiy on 12.04.22.
//

import Foundation

enum ViewState {
    case idle
    case loading
    case success
    case error(Error)
}
