//
//  PageVC.swift
//  MoneyKeeper
//
//  Created by Tran Chung on 6/8/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit

class PageVC: UIPageViewController, UIPageViewControllerDelegate {

    var pageViewControllerDataSource = PageViewControllerDataSource()
    var startViewControllerIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        dataSource = pageViewControllerDataSource
        if let startingViewController: UIViewController = pageViewControllerDataSource.viewControllerAtIndex(startViewControllerIndex) {
            
            let viewControllers = [startingViewController]
            setViewControllers(viewControllers, direction: .forward, animated: false, completion: {done in })
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func jump(toIndex: Int, animated: Bool = true) {
        guard toIndex != NSNotFound && toIndex >= 0 else {
            return
        }
        let direction : UIPageViewControllerNavigationDirection = toIndex > 0 ? .forward : .reverse
        if let viewController = pageViewControllerDataSource.viewControllerAtIndex(toIndex) {
            self.setViewControllers([viewController], direction: direction , animated: true, completion: {done in })
        }
    }
}
