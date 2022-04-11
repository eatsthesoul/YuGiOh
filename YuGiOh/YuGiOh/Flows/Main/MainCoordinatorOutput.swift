//
//  MainCoordinatorOutput.swift
//  YuGiOh
//
//  Created by Evgeniy Petlitskiy on 11.04.22.
//

import Foundation

protocol MainCoordinatorOutput: AnyObject {
    var finishFlow: EmptyClosure? { get set }
}
