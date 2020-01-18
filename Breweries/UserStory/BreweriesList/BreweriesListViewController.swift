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
    private let viewModel: RequestFetch = BreweriesListViewModel()
    private var viewModelArray = BreweryModel()
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
        viewModel.fetch { [unowned self] (result) in
            switch result {
            case .success(let brewery):
                self.viewModelArray = brewery
                self.contentView.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func setNavigationController() {
        navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        title = R.string.localizable.breweries()
        searchController.searchBar.placeholder = Localizable.search()
        definesPresentationContext = true
        searchController.searchBar.setupSearchBar()
        navigationItem.searchController = searchController
    }
}

extension BreweriesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BreweriesListCell.self))
            as? BreweriesListCell else { return UITableViewCell() }
        cell.delegate = self
        cell.update(viewModel: viewModelArray[indexPath.row])
        return cell
    }
}

extension BreweriesListViewController: BreweriesListCellDelegate {
    func tapOnShowOnMapButtonEvent(latitudeString: String, longitudeString: String) {
        navigationController?.pushViewController(LocationViewController(latitudeString: latitudeString,
                                                                        longitudeString: longitudeString),
                                                 animated: true)
    }
    
    func tapOnWebSiteLabelEvent(url: URL) {
        navigationController?.present(SafariViewController(url: url), animated: true, completion: nil)
    }
}
