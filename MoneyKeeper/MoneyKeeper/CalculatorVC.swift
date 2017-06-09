//
//  KeyBoardVC.swift
//  MoneyKeeper
//
//  Created by Tran Chung on 5/30/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit

class CalculatorVC: UIViewController {
    var firstNumberText = ""
    var secondNumberText = ""
    var op = ""
    var isFirstNumber = true
    var hasOp = false
    var canClear = true
    var resultDataLabel: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func hideKeyBoard(_ sender: UIButton) {
        NotificationCenter.default.post(name: NotificationKey.hide, object: nil)
    }
    
    @IBAction func handleButtonPress(_ sender: UIButton) {
            if canClear {
            resultDataLabel = ""
            canClear = false
        }
        let currentText = resultDataLabel
        let textLabel = sender.titleLabel?.text
        if let text = textLabel {
            switch text {
            case "+", "*", ":", "-":
                if hasOp {
                    return
                }
                op = text
                isFirstNumber = false
                hasOp = true
                resultDataLabel = "\(currentText) \(op) "
            case "=":
                isFirstNumber = true
                hasOp = false
                canClear = true
                let result = calculate()
                resultDataLabel = "\(result)"
            case "Delete":
                hasOp = false
                isFirstNumber = false
                canClear = true
                resultDataLabel = ""
            default:
                if isFirstNumber {
                    firstNumberText = "\(firstNumberText)\(text)"
                } else {
                    secondNumberText = "\(secondNumberText)\(text)"
                }
                resultDataLabel = "\(currentText)\(text)"
            }
            NotificationCenter.default.post(name: NotificationKey.calculator, object: resultDataLabel)
        }
    }
    
    func calculate() -> Double {
        let firstNumber = Double(firstNumberText) ?? 0
        let secondNumber = Double(secondNumberText) ?? 0
        firstNumberText = ""
        secondNumberText = ""
        switch op {
        case "+":
            return firstNumber + secondNumber
        case "-":
            return firstNumber - secondNumber
        case "*":
            return firstNumber * secondNumber
        case ":":
            return firstNumber / secondNumber
        default:
            return 0
        }
    }
}

