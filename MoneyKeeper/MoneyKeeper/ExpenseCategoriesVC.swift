//
//  ExpenseCategoriesVC.swift
//  MoneyKeeper
//
//  Created by Chung Tran on 9/21/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit

class ExpenseCategoriesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let viewModel = ExpenseCategoriesModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.reloadSections = { [weak self] (section: Int) in
            self?.tableView.beginUpdates()
            self?.tableView.reloadSections([section], with: .fade)
            self?.tableView.endUpdates()
        }
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.sectionHeaderHeight = 50
        tableView.separatorStyle = .none
        tableView.dataSource = viewModel
        tableView.delegate = viewModel
        tableView.register(HeaderView.nib, forHeaderFooterViewReuseIdentifier: HeaderView.identifier)
        tableView.register(ExpenseCategoriesCell.nib, forCellReuseIdentifier: ExpenseCategoriesCell.identifier)
    }
}
