//
//  Cell.swift
//  MoneyKeeper
//
//  Created by Tran Chung on 6/28/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit

class CellTableView: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var nameCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
