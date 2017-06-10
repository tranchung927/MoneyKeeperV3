//
//  GhiChepVC.swift
//  MoneyKeeper
//
//  Created by Tran Chung on 5/30/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit

struct SegueIdentifier {
    static let sideMenuVC = "SideMenuController"
    static let pageVC = "RecordsTableViewController"
}

class RecordsVC: UIViewController {
    
    var sideMenuVC: SideMenuRecords?
    var pageVC: PageVC?
    var isSideMenuOpen: Bool = true {
        didSet {
            if isSideMenuOpen {
                configForSideMenuOpeningState()

            } else {
                configForSideMenuClosingState()
            }
            UIView.animate(withDuration: 0.35, animations: { 
                self.view.layoutIfNeeded()
            })
        }
    }

    @IBOutlet weak var topSideMenu: NSLayoutConstraint!
    @IBOutlet weak var sideMenuViewContainer: UIView!
    @IBOutlet weak var corverButton: UIButton!
    @IBOutlet weak var bottomKeyBoard: NSLayoutConstraint!
    @IBOutlet weak var keyBoardContainer: UIView!
    @IBOutlet weak var onClickMenu: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        onClickMenu.setTitle("Expence", for: UIControlState.normal)
        self.bottomKeyBoard.constant = -self.keyBoardContainer.bounds.height
        isSideMenuOpen = false
        registerNotificationAppearKeyBoard()
        registerNotificationSideMenu()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    func registerNotificationAppearKeyBoard() {
        NotificationCenter.default.addObserver(self, selector: #selector(appearKeyBoard), name: NotificationKey.appear, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hideKeyBoard), name: NotificationKey.hide, object: nil)
    }
    func registerNotificationSideMenu() {
        NotificationCenter.default.addObserver(self, selector: #selector(configForSideMenuClosingState), name: NotificationKey.hideSideMenu, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
     //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case SegueIdentifier.pageVC:
            pageVC = segue.destination as? PageVC
        case SegueIdentifier.sideMenuVC:
            sideMenuVC = segue.destination as? SideMenuRecords
            sideMenuVC?.delegate = self
        default:
            break
        }
    }
}
