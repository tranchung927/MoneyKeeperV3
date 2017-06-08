//
//  PageVC.swift
//  MoneyKeeper
//
//  Created by Tran Chung on 6/8/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit

class PageVC: UIPageViewController, UIPageViewControllerDelegate {

    var modelController = BaseModelController()
    var startViewControllerIndex = 0
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        dataSource = modelController
        if let startingViewController: UIViewController = self.modelController.viewControllerAtIndex(startViewControllerIndex) {
            
            let viewControllers = [startingViewController]
            setViewControllers(viewControllers, direction: .forward, animated: false, completion: {done in })
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        jump(toIndex: index)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func jump(toIndex: Int, animated: Bool = true) {
        guard toIndex != NSNotFound && toIndex >= 0 else {
            return
        }
        let direction : UIPageViewControllerNavigationDirection = toIndex > index ? .forward : .reverse
        if let viewController = modelController.viewControllerAtIndex(toIndex) {
            self.setViewControllers([viewController], direction: direction , animated: true, completion: {done in })
        }
    }
}
