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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bottomKeyBoard.constant = -self.keyBoardContainer.bounds.height
        isSideMenuOpen = false
        registerNotificationAppearKeyBoard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerNotificationAppearKeyBoard() {
        NotificationCenter.default.addObserver(self, selector: #selector(appearKeyBoard), name: NotificationKey.appear, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hideKeyBoard), name: NotificationKey.hide, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
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

    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case SegueIdentifier.pageVC:
            pageVC = segue.destination as? PageVC
        case SegueIdentifier.sideMenuVC:
            sideMenuVC = segue.destination as? SideMenuRecords
            sideMenuVC?.delegate = pageVC
        default:
            break
        }
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
