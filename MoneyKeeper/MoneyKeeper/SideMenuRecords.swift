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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NotificationCenter.default.post(name: NotificationKey.hideSideMenu, object: nil)
        let cell = tableView.cellForRow(at: indexPath)
        let text = cell?.textLabel?.text
        delegate?.passedNameTitleMenu(name: text!)
        switch indexPath.row {
        case 0:
            delegate?.passData(indexOf: 1)
        case 1:
            delegate?.passData(indexOf: 2)
        case 2:
            delegate?.passData(indexOf: 3)
        case 3:
            delegate?.passData(indexOf: 4)
        default:
            return
        }
    }
}
protocol SideMenuRecordsDelegate {
    func passData(indexOf: Int)
    func passedNameTitleMenu(name: String)
}
