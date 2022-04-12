//
//  MainViewController.swift
//  YuGiOh
//
//  Created by Evgeniy Petlitskiy on 11.04.22.
//

import UIKit

final class MainViewController: UIViewController {
    
    var viewModel: MainViewModelling?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}

extension MainViewController: MainViewInput {
    func didUpdate(with state: ViewState) {
        
    }
}
