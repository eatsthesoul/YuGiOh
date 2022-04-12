//
//  MainViewInput.swift
//  YuGiOh
//
//  Created by Evgeniy Petlitskiy on 11.04.22.
//

import Foundation

protocol MainViewInput: AnyObject {
    func didUpdate(with state: ViewState)
}
