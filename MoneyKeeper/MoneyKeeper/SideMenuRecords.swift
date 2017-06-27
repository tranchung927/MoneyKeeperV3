//
//  SideMenuRecords.swift
//  MoneyKeeper
//
//  Created by Tran Chung on 6/7/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit

class SideMenuRecords: UITableViewController {
    
    var delegate: SideMenuRecordsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let text = cell?.textLabel?.text
        delegate?.passedNameTitleMenu(name: text!)
        delegate?.passData(indexOf: indexPath.row)
    }
}
protocol SideMenuRecordsDelegate {
    func passData(indexOf: Int)
    func passedNameTitleMenu(name: String)
}
