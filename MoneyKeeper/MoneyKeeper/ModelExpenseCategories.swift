//
//  ModelExpenseCategories.swift
//  MoneyKeeper
//
//  Created by Chung Tran on 9/21/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit
// MARK: Model
class ModelCell {
    var image: UIImage?
    var title: String?
    
    init(dataModelCell: DataModel) {
        self.image = dataModelCell.image
        self.title = dataModelCell.title
    }
}

class ModelSection: ExpenseCategoriesModelItem {
    var image: UIImage
    var title: String
    var rows: [ModelCell]
    
    var rowCount: Int {
        return rows.count
    }
    
    var isCollapsed = true
    
    init(dataModelSection: DataModel, cells: [ModelCell]) {
        self.image = dataModelSection.image
        self.title = dataModelSection.title
        self.rows = cells
    }
}
