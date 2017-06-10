//
//  RecordsVC+SideMenu.swift
//  MoneyKeeper
//
//  Created by Tran Chung on 6/10/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit
extension RecordsVC: SideMenuRecordsDelegate {
    
    func passData(indexOf: Int) {
        isSideMenuOpen = false
        switch indexOf {
        case 1:
            pageVC?.jump(toIndex: 0)
        case 2:
            pageVC?.jump(toIndex: 1)
        case 3:
            pageVC?.jump(toIndex: 2)
        case 4:
            pageVC?.jump(toIndex: 3)
        default:
            return
        }
    }
    func passedNameTitleMenu(name: String) {
        onClickMenu.setTitle(name, for: UIControlState.normal)
    }
    
}
extension RecordsVC {
    func configForSideMenuOpeningState() {
        self.sideMenuViewContainer.clipsToBounds = false
        self.topSideMenu.constant = 0
        self.corverButton.alpha = 0.5
        self.corverButton.isHidden = false
    }
    func configForSideMenuClosingState() {
        self.sideMenuViewContainer.clipsToBounds = true
        self.topSideMenu.constant = -self.sideMenuViewContainer.bounds.height
        self.corverButton.alpha = 0
        self.corverButton.isHidden = true
    }
    
    @IBAction func onClickCorverButton(_ sender: Any) {
        isSideMenuOpen = !isSideMenuOpen
    }
    
    @IBAction func onClickMenu(_ sender: Any) {
        isSideMenuOpen = !isSideMenuOpen
    }
}
