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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setApperanceForNavBar()
        setNavigationController()
        setupSearchController()
    }
    
    private func setNavigationController() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func setupSearchController() {
//        searchController.searchResultsUpdater = self
        if #available(iOS 13.0, *) {
            searchController.searchBar.searchTextField.backgroundColor = .white
            searchController.searchBar.searchTextField.tintColor = R.color.darkGrassGreen()
        } else {
            for textField in searchController.searchBar.subviews.first!.subviews where textField is UITextField {
                textField.subviews.first?.backgroundColor = .white
                textField.subviews.first?.layer.cornerRadius = 10.5
                textField.subviews.first?.layer.masksToBounds = true
                textField.tintColor = R.color.darkGrassGreen()
            }
        }
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        definesPresentationContext = true
        navigationItem.searchController = searchController
        
    }
}
