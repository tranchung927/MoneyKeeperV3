//
//  GhiChepTVC.swift
//  MoneyKeeper
//
//  Created by Tran Chung on 5/30/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit

class RecordsTableVC: UITableViewController {
    static var instance: RecordsTableVC {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "RecordsTableVC") as! RecordsTableVC
    }
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension RecordsTableVC: UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        NotificationCenter.default.post(name: NotificationKey.appear, object: nil)
        return true
    }
}
//extension RecordsTableVC: CalculatorVCDelegate {
//    func passData(content: String) {
//        textFieldCalculator.text = content
//    }
//    
//    func disableEditText() {
//        textFieldCalculator.resignFirstResponder()
//    }
//}
