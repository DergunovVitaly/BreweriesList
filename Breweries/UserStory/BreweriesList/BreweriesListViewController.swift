//
//  BreweriesListViewController.swift
//  Breweries
//
//  Created by  Vitaly Dergunov on 16.01.2020.
//  Copyright © 2020 VitaliiDerhunov. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
import Reachability

class BreweriesListViewController: UIViewController {
    
    private var viewModelArray = BreweryModel()
    private var filteredViewModelArray = BreweryModel()
    private let dataBaseService = DataBaseService()
    private let contentView = BreweriesListView()
    private let viewModel: RequestFetch = BreweriesListViewModel()
    private let searchController = UISearchController(searchResultsController: nil)
    
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    private var isActiveSearchBar: Bool {
        let activeSearch = searchController.isActive && !searchBarIsEmpty
        return activeSearch
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        NetworkReachabilityManager.shared.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
        contentView.tableView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationController()
        setApperanceForNavBar(backgroundColor: R.color.darkGrassGreen())
    }
    
    private func setNavigationController() {
        title = R.string.localizable.breweries()
        navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        searchController.searchBar.placeholder = Localizable.search()
        searchController.searchBar.setupSearchBar()
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        definesPresentationContext = true
        navigationItem.searchController = searchController
    }
}

extension BreweriesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = isActiveSearchBar ? filteredViewModelArray.count : viewModelArray.count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BreweriesListCell.self))
            as? BreweriesListCell else { return UITableViewCell() }
        cell.delegate = self
        cell.update(viewModel: isActiveSearchBar ? filteredViewModelArray[indexPath.row] :
            viewModelArray[indexPath.row])
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

extension BreweriesListViewController: NetworkReachabilityManagerDelegate {
    func reachabilityChanged(connection: Reachability.Connection) {
        switch connection {
        case .cellular, .wifi:
            viewModel.fetch { [unowned self] (result) in
                switch result {
                case .success(let brewery):
                    brewery.forEach { self.dataBaseService.writeToDataBase(breweryModel: $0) }
                    self.viewModelArray = self.dataBaseService.readFromDataBase()
                case .failure(let error):
                    self.viewModelArray = self.dataBaseService.readFromDataBase()
                    print(error)
                }
                self.contentView.tableView.reloadData()
            }
        case .none, .unavailable:
            viewModelArray = self.dataBaseService.readFromDataBase()
            self.contentView.tableView.reloadData()
        }
    }
}

extension BreweriesListViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        filterContentForSearchText(text)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        viewModel.search(name: searchText) { [unowned self] (result) in
            switch result {
            case .success(let brewery):
                self.filteredViewModelArray = brewery
            case .failure(let error):
                print(error)
            }
            self.contentView.tableView.reloadData()
        }
    }
}
