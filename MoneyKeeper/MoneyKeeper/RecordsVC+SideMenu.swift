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
        pageVC?.jump(toIndex: indexOf)
    }
    func passedNameTitleMenu(name: String) {
        onClickMenu.setTitle(name, for: UIControlState.normal)
    }
}
extension RecordsVC {
    func registerNotificationPageVC(){
        NotificationCenter.default.addObserver(self, selector:#selector(setName), name: NotificationKey.sideMenu, object: nil)
    }
    func setName(notification: Notification) {
        let name = notification.object as? String
        onClickMenu.setTitle(name, for: UIControlState.normal)
    }
    func setStageSideMenu(isSideMenuOpen: Bool) {
        if isSideMenuOpen {
            self.sideMenuViewContainer.isHidden = false
        }
        self.corverButton.isHidden = isSideMenuOpen ? false : true
        UIView.animate(withDuration: 0.35, animations: {
            self.topSideMenu.constant = isSideMenuOpen ? 0 : -self.sideMenuViewContainer.bounds.height
            self.corverButton.alpha = isSideMenuOpen ? 0.35 : 0
            self.view.layoutIfNeeded()},
            completion: { (isSuccess) in
                if !isSideMenuOpen {
                    self.sideMenuViewContainer.isHidden = true
            }
        })
    }
    
    @IBAction func onClickCorverButton(_ sender: Any) {
        isSideMenuOpen = !isSideMenuOpen
    }
    
    @IBAction func onClickMenu(_ sender: Any) {
        isSideMenuOpen = !isSideMenuOpen
    }
}
