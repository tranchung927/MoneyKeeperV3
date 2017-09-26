//
//  HeaderView.swift
//  MoneyKeeper
//
//  Created by Chung Tran on 9/21/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit

protocol HeaderViewDelegate: class {
    func toggleSection(header: HeaderView, section: Int)
}

class HeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var arrowLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageHeader: UIImageView!
    
    var item: ExpenseCategoriesModelItem? {
        didSet {
            guard let item = item else {
                return
            }
            
            titleLabel?.text = item.title
            imageHeader.image = item.image
            setCollapsed(collapsed: item.isCollapsed)
        }
    }
    var section: Int = 0
    
    weak var delegate: HeaderViewDelegate?
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapHeader)))
    }
    
    @objc private func didTapHeader() {
        delegate?.toggleSection(header: self, section: section)
    }

    func setCollapsed(collapsed: Bool) {
        arrowLabel?.rotate(collapsed ? .pi : 0.0)
    }
}
