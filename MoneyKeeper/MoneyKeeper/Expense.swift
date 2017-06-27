//
//  GhiChepTVC.swift
//  MoneyKeeper
//
//  Created by Tran Chung on 5/30/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit

class Expense: UITableViewController {
    static var instance: Expense {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "Expense") as! Expense
    }
    let nameCurrent = "Expense"
    @IBOutlet weak var borrowToPay: UIButton!
    @IBOutlet weak var unitRightView: UIView!
    @IBOutlet weak var textFieldCalculator: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldCalculator.rightView = unitRightView
        textFieldCalculator.rightViewMode = .always
        textFieldCalculator.delegate = self
        registerNotificationHideKeyBoard()
        registerTextField()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.post(name: NotificationKey.hide, object: nameCurrent)
    }
    func registerTextField(){
        NotificationCenter.default.addObserver(self, selector: #selector(getTextFieldData), name: NotificationKey.calculator, object: nil)
    }
    func registerNotificationHideKeyBoard(){
        NotificationCenter.default.addObserver(self, selector: #selector(hiddenKeyBoard), name: NotificationKey.hide, object: nil)
    }
    func hiddenKeyBoard() {
        textFieldCalculator.resignFirstResponder()
    }
    func getTextFieldData(notification: Notification){
        let string = notification.object as! String
        textFieldCalculator.text = string
    }
    @IBAction func borrowToPay(_ sender: Any) {
        if borrowToPay.isSelected {
            borrowToPay.setImage(UIImage(named:"Checked"), for: .normal)
            borrowToPay.isSelected = false
        }else {
            borrowToPay.setImage(UIImage(named:"Unchecked"), for: .selected)
            borrowToPay.isSelected = true
        }
//        tableView.reloadRows(at: [IndexPath.init(row: CellIndex.lender.rawValue, section: 0)], with: .automatic)
        tableView.reloadData()
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    enum CellIndex : Int {
        case distance0
        case texFieldCalculator
        case distance1
        case category
        case description
        case distance2
        case account
        case date
        case payee
        case event
        case borrow
        case lender
        case save
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case CellIndex.texFieldCalculator.rawValue:
            return 60
        case CellIndex.lender.rawValue:
            return borrowToPay.isSelected ? 0 : 55
        case CellIndex.distance0.rawValue, CellIndex.distance1.rawValue, CellIndex.distance2.rawValue:
            return 8
        default:
            return 55
        }
    }
}

extension Expense: UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        NotificationCenter.default.post(name: NotificationKey.appear, object: nil)
        return true
    }
}

