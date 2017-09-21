//
//  ExpenseCategoriesCell.swift
//  MoneyKeeper
//
//  Created by Chung Tran on 9/21/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit

class ExpenseCategoriesCell: UITableViewCell {
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var nameCell: UILabel!

    var item: ModelCell? {
        didSet {
            imageCell.image = item?.image
            nameCell.text = item?.title
        }
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
