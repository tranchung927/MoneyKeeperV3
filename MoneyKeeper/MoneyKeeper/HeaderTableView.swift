//
//  Header.swift
//  MoneyKeeper
//
//  Created by Tran Chung on 6/28/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit
protocol HeaderTableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectAtHeader section: Int)
}
class HeaderTableView: UITableViewCell {

    @IBOutlet weak var rotationSectionIcon: UIImageView!
    @IBOutlet weak var imageHeader: UIImageView!
    @IBOutlet weak var nameHeader: UILabel!
    
    var delegate: HeaderTableViewDelegate?
    var section: Int?
    var tableView: UITableView?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    @IBAction func didSelectHeader(_ sender: Any) {
        delegate?.tableView(tableView!, didSelectAtHeader: section!)
    }
}
