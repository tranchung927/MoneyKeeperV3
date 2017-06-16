//
//  KeyBoardVC.swift
//  MoneyKeeper
//
//  Created by Tran Chung on 5/30/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit

class CalculatorVC: UIViewController {
    
    var resultDataLabel: String!
    var displayValue: Double {
        get {
            return Double(resultDataLabel)!
        }
        set {
            resultDataLabel = String(newValue)
            NotificationCenter.default.post(name: NotificationKey.calculator, object: resultDataLabel)
        }
    }
    
    var userIsInTheMiddleOfTyping = false
    
    private var brain = CalculatorBrain()
    
    @IBAction func clearButton(_ sender: UIButton) {
        resultDataLabel = ""
        NotificationCenter.default.post(name: NotificationKey.calculator, object: resultDataLabel)
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
        
    }

    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        if let result = brain.result {
            displayValue = result
        }
    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = resultDataLabel!
            resultDataLabel = textCurrentlyInDisplay + digit
        } else {
            resultDataLabel = digit
            userIsInTheMiddleOfTyping = true
        }
        NotificationCenter.default.post(name: NotificationKey.calculator, object: resultDataLabel)
    }

    @IBAction func hideKeyBoard(_ sender: UIButton) {
        NotificationCenter.default.post(name: NotificationKey.hide, object: nil)
    }
}

