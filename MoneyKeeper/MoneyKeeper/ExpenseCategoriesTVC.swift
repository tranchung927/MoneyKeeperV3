//
//  ExpenseCategoriesTVC.swift
//  MoneyKeeper
//
//  Created by Tran Chung on 6/28/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit
typealias SectionData = (image: UIImage, title: String, expanded: Bool)
typealias CellData = (image: UIImage, title: String)
class ExpenseCategoriesTVC: UITableViewController, ExpandableHeaderViewDelegate {
    var isHeaderSection: Bool = true
    var displayedViewContents : [[CellData]] = []
    let tableViewContents : [[CellData]] = [
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
    
    var tableViewSection: [Section] = [(Section(image: #imageLiteral(resourceName: "Food and Dining"), title: "Food and Dining", expanded: false)),
                                       (Section(image: #imageLiteral(resourceName: "Utilities"), title: "Utilities", expanded: false)),
                                       (Section(image: #imageLiteral(resourceName: "Auto & Transport"), title: "Auto & Transport", expanded: false)),
                                       (Section(image: #imageLiteral(resourceName: "Kids"), title: "Kids", expanded: false)),
                                       (Section(image: #imageLiteral(resourceName: "Clothing"), title: "Clothing", expanded: false)),
                                       (Section(image: #imageLiteral(resourceName: "Gifts & Donations"), title: "Gifts & Donations", expanded: false)),
                                       (Section(image: #imageLiteral(resourceName: "Health & Fitness"), title: "Health & Fitness", expanded: false)),
                                       (Section(image: #imageLiteral(resourceName: "Home"), title: "Home", expanded: false)),
                                       (Section(image: #imageLiteral(resourceName: "Entertainment"), title: "Entertainment", expanded: false)),
                                       (Section(image: #imageLiteral(resourceName: "Personal"), title: "Personal", expanded: false))]
    override func viewDidLoad() {
        super.viewDidLoad()
        displayedViewContents = tableViewContents
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return displayedViewContents.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedViewContents[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CellTableView
            cell.imageCell.image = displayedViewContents[indexPath.section][indexPath.row].image
            cell.nameCell?.text = displayedViewContents[indexPath.section][indexPath.row].title
            return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (tableViewSection[indexPath.section].expanded){
            return 44
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExpandableHeaderView()
        header.customInit(title: tableViewSection[section].title, section: section, delegate: self)
        return header
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    func toggleSection(header: ExpandableHeaderView, section: Int) {
        tableViewSection[section].expanded = !tableViewSection[section].expanded
        
        
        tableView.beginUpdates()
        for i in 0 ..< displayedViewContents[section].count {
            tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        tableView.endUpdates()
    }
}
