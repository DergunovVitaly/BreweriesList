//
//  BreweriesListViewController.swift
//  Breweries
//
//  Created by  Vitaly Dergunov on 16.01.2020.
//  Copyright © 2020 VitaliiDerhunov. All rights reserved.
//

import Foundation
import UIKit

class BreweriesListViewController: UIViewController {
    private let contentView = BreweriesListView()
    
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    override func loadView() {
        view = contentView
        contentView.tableView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setApperanceForNavBar(backgroundColor: R.color.darkGrassGreen())
        setNavigationController()
    }
    
    private func setNavigationController() {
        navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        title = R.string.localizable.breweries()
        searchController.searchBar.placeholder = "Search"
        definesPresentationContext = true
        navigationItem.searchController = searchController
        searchController.searchBar.setCenteredPlaceHolder()
        searchController.searchBar.setupSearchBar()
    }
}

extension BreweriesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BreweriesListCell.self))
            as? BreweriesListCell else { return UITableViewCell() }
        return cell
    }
}
