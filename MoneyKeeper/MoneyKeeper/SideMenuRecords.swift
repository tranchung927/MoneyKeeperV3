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
        switch indexPath.row {
        case 0:
            delegate?.passData(content: 1)
        case 1:
            delegate?.passData(content: 2)
        case 2:
            delegate?.passData(content: 3)
        case 3:
            delegate?.passData(content: 4)
        default:
            return
        }
    }
}
protocol SideMenuRecordsDelegate {
    func passData(content: Int)
}
