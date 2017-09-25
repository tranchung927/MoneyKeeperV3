//
//  BaseModelController.swift
//  MoneyKeeper
//
//  Created by Tran Chung on 6/8/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit

class BaseModelController: NSObject, UIPageViewControllerDataSource {
    
    var viewcontrollers: [UIViewController] = {
        let greenVC = GreenVC.instance
        let redVC = RedVC.instance
        let bluVC = BluVC.instance
//        let expense = Expense.instance
        let menuControllers = [bluVC, redVC, greenVC]
        return menuControllers
    }()
    
    func viewControllerAtIndex(_ index: Int) -> UIViewController? {
        // Return the data view controller for the given index.
        if (self.viewcontrollers.count == 0) || (index >= self.viewcontrollers.count) || (index < 0) || (index == NSNotFound){
            return nil
        }
        return viewcontrollers[index]
    }
    
    func indexOfViewController(_ viewController: UIViewController) -> Int {
        return viewcontrollers.index(of: viewController) ?? NSNotFound
    }
    
    // MARK: - Page View Controller Data Source
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = self.indexOfViewController(viewController)
        return self.viewControllerAtIndex(index-1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = self.indexOfViewController(viewController)
        return self.viewControllerAtIndex(index+1)
    }
}
