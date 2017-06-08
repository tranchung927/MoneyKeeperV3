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
        NotificationCenter.default.addObserver(self, selector: #selector(hiddenKeyBoard), name: NotificationKey.hide, object: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func hiddenKeyBoard() {
        textFieldCalculator.resignFirstResponder()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension RecordsTableVC: UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        NotificationCenter.default.post(name: NotificationKey.name, object: nil)
        return true
    }
}
extension RecordsTableVC: CalculatorVCDelegate {
    func passData(content: String) {
        textFieldCalculator.text = content
    }
    
    func disableEditText() {
        textFieldCalculator.resignFirstResponder()
    }
}
