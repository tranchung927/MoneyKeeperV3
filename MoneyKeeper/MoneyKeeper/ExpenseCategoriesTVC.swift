//
//  ExpenseCategoriesTVC.swift
//  MoneyKeeper
//
//  Created by Tran Chung on 6/28/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit

class ExpenseCategoriesTVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataServices.shared.sectionAtCurrent(json: "Section")
        NotificationCenter.default.addObserver(self, selector: #selector(updateData), name: NotificationKey.update, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func updateData() {
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return DataServices.shared.sectionCategories?.arraySections.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataServices.shared.sectionCategories?.arraySections[section].arrayCells.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        if let cellInfo = DataServices.shared.sectionCategories?.arraySections[indexPath.section] {
            cell.nameCell.text = cellInfo.arrayCells[indexPath.row].nameCell
            cell.imageCell.image = UIImage(named: cellInfo.arrayCells[indexPath.row].nameCell)
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view: Header = tableView.dequeueReusableCell(withIdentifier: "Header") as! Header
        if let sectionInfo = DataServices.shared.sectionCategories?.arraySections[section] {
            view.nameHeader.text = sectionInfo.nameSection
            view.imageHeader.image = UIImage(named: sectionInfo.nameSection)
        }
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }

}
