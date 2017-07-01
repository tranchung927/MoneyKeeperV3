//
//  Section.swift
//  MoneyKeeper
//
//  Created by Admin on 7/1/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit

struct Section {
    var image: UIImage!
    var title: String!
    var expanded: Bool!
    
    init(image: UIImage, title: String, expanded: Bool) {
        self.image = image
        self.title = title
        self.expanded = expanded
    }
}
