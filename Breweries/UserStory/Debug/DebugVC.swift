//
//  DebugVC.swift
//
//
//  Created by Vitalii Derhunov on 8/13/19.
//  Copyright © 2019 Vitalii Derhunov. All rights reserved.
//

import UIKit
import AlisterSwift

struct DebugSettings {
    static let isDebug = true
}

struct DebugCellVM: ViewModelInterface {
    let title: String
}

class DebugCell: UITableViewCell, ReusableViewInterface {
    func update(_ model: ViewModelInterface) {
        guard let viewModel = model as? DebugCellVM else {
            assert(false, "Incorrect viewModel")
            return
        }
        textLabel?.text = viewModel.title
    }
}

private enum DebugRow: Int, CaseIterable {
    case signIn
    
    var name: String {
        switch self {
        case .signIn:
            return "Sign In"
        }
    }
}

class DebugVC: UIViewController {
    private let tableView = UITableView()
    private lazy var controller: TableController = {
        return TableController(tableView: tableView)
    }()
    
    override func loadView() {
        view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        controller.configureCells {
            $0.register(cell: DebugCell.self, for: DebugCellVM.self)
        }
        
        controller.storage.update {
            $0.add(DebugRow.allCases.map { DebugCellVM(title: $0.name) })
        }
        
        controller.selection = { (_, indexPath) in
            guard let row = DebugRow(rawValue: indexPath.row) else { return }
            switch row {
            case .signIn:
            let breweriesListVC = UINavigationController(rootViewController: BreweriesListViewController())
            self.present(breweriesListVC, animated: true, completion: nil)
            }
        }
    }
}
