//
//  ExpenseCategoriesTVC.swift
//  MoneyKeeper
//
//  Created by Tran Chung on 6/28/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit

typealias CellData = (image: UIImage, title: String)
class ExpenseCategoriesTVC: UITableViewController {
    
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
    
    let tableViewSection: [CellData] = [(#imageLiteral(resourceName: "Food and Dining"), "Food and Dining"),
                                        (#imageLiteral(resourceName: "Utilities"), "Utilities"),
                                        (#imageLiteral(resourceName: "Auto & Transport"), "Auto & Transport"),
                                        (#imageLiteral(resourceName: "Kids"), "Kids"),
                                        (#imageLiteral(resourceName: "Clothing"), "Clothing"),
                                        (#imageLiteral(resourceName: "Gifts & Donations"), "Gifts & Donations"),
                                        (#imageLiteral(resourceName: "Health & Fitness"), "Health & Fitness"),
                                        (#imageLiteral(resourceName: "Home"), "Home"),
                                        (#imageLiteral(resourceName: "Entertainment"), "Entertainment"),
                                        (#imageLiteral(resourceName: "Personal"), "Personal")]
    override func viewDidLoad() {
        super.viewDidLoad()
        displayedViewContents = tableViewContents
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return displayedViewContents.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedViewContents[section].count+1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let isHeaderSesion = indexPath.row == 0
        if isHeaderSesion {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Header") as! HeaderTableView
            cell.imageHeader.image = tableViewSection[indexPath.section].image
            cell.nameHeader.text = tableViewSection[indexPath.section].title
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CellTableView
            cell.imageCell.image = displayedViewContents[indexPath.section][indexPath.row-1].image
            cell.nameCell?.text = displayedViewContents[indexPath.section][indexPath.row-1].title
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let isHeaderSection = indexPath.row == 0
        if isHeaderSection {
            let cellInSection = displayedViewContents[indexPath.section]
            if cellInSection.count != 0 {
                var willRemoveIndexPaths : [IndexPath] = []
                for row in 1 ... displayedViewContents[indexPath.section].count {
                    let willRemoveIndexPath = IndexPath(row: row, section: indexPath.section)
                    willRemoveIndexPaths.append(willRemoveIndexPath)
                }
                displayedViewContents[indexPath.section].removeAll()
                self.tableView.beginUpdates()
                tableView.deleteRows(at: willRemoveIndexPaths, with: .fade)
                self.tableView.endUpdates()
                
            } else {
                displayedViewContents[indexPath.section] = tableViewContents[indexPath.section]
                var willAddIndexPaths : [IndexPath] = []
                for row in 1 ... displayedViewContents[indexPath.section].count {
                    let willRemoveIndexPath = IndexPath(row: row, section: indexPath.section)
                    willAddIndexPaths.append(willRemoveIndexPath)
                }
                self.tableView.beginUpdates()
                tableView.insertRows(at: willAddIndexPaths, with: .fade)
                self.tableView.endUpdates()
            }
        }
    }
}
