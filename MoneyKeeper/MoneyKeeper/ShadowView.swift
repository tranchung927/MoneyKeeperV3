//
//  ShadowView.swift
//  MoneyKeeper
//
//  Created by Tran Chung on 6/6/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit
@IBDesignable
class ShadowView: UIView {
    @IBInspectable
    var shadowColor: UIColor = UIColor.black{
        didSet {
            self.layer.shadowColor = UIColor.black.cgColor
        }
    }
    
    @IBInspectable
    var shadowOpacity: CGFloat = 0.8 {
        didSet {
            self.layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    @IBInspectable
    var shadowOffset: CGSize = CGSize.zero {
        didSet {
            self.layer.shadowOffset = shadowOffset
        }
    }
    @IBInspectable
    var shadowRadius: CGFloat = 0 {
        didSet {
            self.layer.shadowRadius = shadowRadius
        }
    }
}
