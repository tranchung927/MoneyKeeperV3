//
//  ExpenseCategoriesModel.swift
//  MoneyKeeper
//
//  Created by Chung Tran on 9/21/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit

typealias DataModel = (image: UIImage, title: String)

protocol ExpenseCategoriesModelItem {
    var rows: [ModelCell] { get }
    var title: String { get }
    var image: UIImage { get }
    var rowCount: Int { get }
    var isCollapsible: Bool { get }
    var isCollapsed: Bool { get set }
}

extension ExpenseCategoriesModelItem {
    var rowCount: Int {
        return 1
    }
    var isCollapsible: Bool {
        return true
    }
}

class ExpenseCategoriesModel: NSObject {
    
    var items = [ExpenseCategoriesModelItem]()
    var reloadSections: ((_ section: Int) -> Void)?
    
    override init() {
        super.init()
        let cells : [[DataModel]] = [
            [(#imageLiteral(resourceName: "Groceries"), "Groceries"),
             (#imageLiteral(resourceName: "Restaurant"), "Restaurant"),
             (#imageLiteral(resourceName: "Bar & Coffee"), "Bar & Coffee")],
            
            
            [(#imageLiteral(resourceName: "Electricity"), "Electricity"),
             (#imageLiteral(resourceName: "Water"), "Water"),
             (#imageLiteral(resourceName: "Internet"), "Internet"),
             (#imageLiteral(resourceName: "Gas"), "Gas"),
             (#imageLiteral(resourceName: "Cable TV"), "Cable TV"),
             (#imageLiteral(resourceName: "MobilePhone"), "MobilePhone"),
             (#imageLiteral(resourceName: "HomePhone"), "HomePhone")],
            
            [(#imageLiteral(resourceName: "Fuel"), "Fuel"),
             (#imageLiteral(resourceName: "Service & Parts"), "Service & Parts"),
             (#imageLiteral(resourceName: "Repair vehicles"), "Repair vehicles"),
             (#imageLiteral(resourceName: "Parking"), "Parking"),
             (#imageLiteral(resourceName: "Car wash"), "Car wash"),
             (#imageLiteral(resourceName: "Taxi"), "Taxi")],
            
            [(#imageLiteral(resourceName: "Tuition"), "Tuition"),
             (#imageLiteral(resourceName: "Books"), "Books"),
             (#imageLiteral(resourceName: "Baby Supplies"), "Baby Supplies"),
             (#imageLiteral(resourceName: "Toys"), "Toys"),
             (#imageLiteral(resourceName: "Allowance"), "Allowance")],
            
            [(#imageLiteral(resourceName: "Clothes"), "Clothes"),
             (#imageLiteral(resourceName: "Shoes"), "Shoes"),
             (#imageLiteral(resourceName: "Accessories"), "Accessories")],
            
            [(#imageLiteral(resourceName: "Marriages"), "Marriages"),
             (#imageLiteral(resourceName: "Funerals"), "Funerals"),
             (#imageLiteral(resourceName: "Charity"), "Charity"),
             (#imageLiteral(resourceName: "Gifts"), "Gifts")],
            
            [(#imageLiteral(resourceName: "Doctor"), "Doctor"),
             (#imageLiteral(resourceName: "Pharmacy"), "Pharmacy"),
             (#imageLiteral(resourceName: "Sports"), "Sports")],
            
            [(#imageLiteral(resourceName: "Furnishing"), "Furnishing"),
             (#imageLiteral(resourceName: "Repair of building"), "Repair of building"),
             (#imageLiteral(resourceName: "Home services"), "Home services")],
            
            [(#imageLiteral(resourceName: "Music"), "Music"),
             (#imageLiteral(resourceName: "Travel"), "Travel"),
             (#imageLiteral(resourceName: "Make up"), "Make up"),
             (#imageLiteral(resourceName: "Movies & DVDs"), "Movies & DVDs"),
             (#imageLiteral(resourceName: "Cosmetic"), "Cosmetic")],
            
            [(#imageLiteral(resourceName: "Education"), "Education"),
             (#imageLiteral(resourceName: "Hobbies"), "Hobbies")]
        ]
        
        let sections: [DataModel] = [(image: #imageLiteral(resourceName: "Food and Dining"), title: "Food and Dining"),
                                     (image: #imageLiteral(resourceName: "Utilities"), title: "Utilities"),
                                     (image: #imageLiteral(resourceName: "Auto & Transport"), title: "Auto & Transport"),
                                     (image: #imageLiteral(resourceName: "Kids"), title: "Kids"),
                                     (image: #imageLiteral(resourceName: "Clothing"), title: "Clothing"),
                                     (image: #imageLiteral(resourceName: "Gifts & Donations"), title: "Gifts & Donations"),
                                     (image: #imageLiteral(resourceName: "Health & Fitness"), title: "Health & Fitness"),
                                     (image: #imageLiteral(resourceName: "Home"), title: "Home"),
                                     (image: #imageLiteral(resourceName: "Entertainment"), title: "Entertainment"),
                                     (image: #imageLiteral(resourceName: "Personal"), title: "Personal")]
        
        for index in 0...cells.count - 1 {
            var cellsInSection: [ModelCell] = []
            for cell in cells[index] {
                let oneCell: ModelCell = ModelCell(dataModelCell: cell)
                cellsInSection.append(oneCell)
            }
            let section: ModelSection = ModelSection(dataModelSection: sections[index], cells: cellsInSection)
            items.append(section)
        }
    }
}
// MARK: TableView DataSource
extension ExpenseCategoriesModel: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let item = items[section]
        
        guard item.isCollapsible else {
            return item.rowCount
        }
        
        if item.isCollapsed {
            return 0
        } else {
            return item.rowCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: ExpenseCategoriesCell.identifier, for: indexPath) as! ExpenseCategoriesCell
        cell.item = item.rows[indexPath.row]
        return cell
    }
}

// MARK: TableView Delegate
extension ExpenseCategoriesModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderView.identifier) as? HeaderView {
            let item = items[section]
            headerView.item = item
            headerView.section = section
            headerView.delegate = self
            headerView.contentView.backgroundColor = UIColor.white
            return headerView
        }
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

// MARK: HeaderView Delegate
extension ExpenseCategoriesModel: HeaderViewDelegate {
    func toggleSection(header: HeaderView, section: Int) {
        var item = items[section]
        if item.isCollapsible {
            
            // Toggle collapse
            let collapsed = !item.isCollapsed
            item.isCollapsed = collapsed
            header.setCollapsed(collapsed: collapsed)
            
            // Adjust the number of the rows inside the section
            reloadSections?(section)
        }
    }
}

