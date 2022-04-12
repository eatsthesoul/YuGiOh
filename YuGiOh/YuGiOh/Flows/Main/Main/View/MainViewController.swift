//
//  MainViewController.swift
//  YuGiOh
//
//  Created by Evgeniy Petlitskiy on 11.04.22.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    var viewModel: MainViewModelling!
    
    // MARK: - Private properties
    
    private lazy var filteringSegmentedControl: UISegmentedControl = {
        let view = UISegmentedControl(items: CardType.allCases.map{ $0.name })
        view.selectedSegmentIndex = 0
        view.addTarget(self, action: #selector(didChangeFilteringValue), for: .valueChanged)
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CardListCell.self, forCellReuseIdentifier: String(describing: CardListCell.self))
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        addSubviews()
        configureLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadCards()
    }
}

// MARK: - Appearance Methods

private extension MainViewController {
    
    func setupAppearance() {
        view.backgroundColor = .white
        navigationItem.titleView = filteringSegmentedControl
    }
    
    func addSubviews() {
        view.addSubview(tableView)
    }
    
    func configureLayout() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

// MARK: - Selectors

extension MainViewController {
    @objc func didChangeFilteringValue() {
        viewModel.filterBy(type: CardType(rawValue: filteringSegmentedControl.selectedSegmentIndex) ?? .all)
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CardListCell.self),
                                                 for: indexPath) as? CardListCell
        else { return UITableViewCell() }
        
        let cardInfo = viewModel.getCardInfo(for: indexPath)
        cell.configure(with: cardInfo)
        
        return cell
    }
}

// MARK: - MainViewInput

extension MainViewController: MainViewInput {
    
    func didUpdate(with state: ViewState) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            switch state {
            case .idle:
                break
            case .loading:
                self.startLoading()
            case .success:
                self.stopLoading()
                self.tableView.setContentOffset(.zero, animated: true)
                self.tableView.reloadData()
            case .error(let error):
                self.stopLoading()
                self.presentDefaultAlert(title: "Oops",
                                         message: error.localizedDescription,
                                         buttonTitle: "Try Again") {
                    self.viewModel.loadCards()
                }
            }
        }
    }
}
