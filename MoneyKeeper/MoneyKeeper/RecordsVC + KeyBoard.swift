//
//  RecordsVC + KeyBoard.swift
//  MoneyKeeper
//
//  Created by Tran Chung on 6/10/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit

extension RecordsVC {
    func hideKeyBoard() {
        self.keyBoardContainer.clipsToBounds = true
        self.bottomKeyBoard.constant = -self.keyBoardContainer.bounds.height
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    func appearKeyBoard() {
        self.keyBoardContainer.clipsToBounds = false
        self.bottomKeyBoard.constant = 50
        UIView.animate(withDuration: 0.35, animations: {
            self.view.layoutIfNeeded()
        })
    }
}
