//
//  NotificationKey.swift
//  MoneyKeeper
//
//  Created by Tran Chung on 5/30/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import Foundation

struct NotificationKey {
    static let appear = Notification.Name.init("appear")
    static let hide = Notification.Name.init("hide")
    static let calculator = Notification.Name.init("calculator")
    static let sideMenu = Notification.Name.init("sideMenu")
    static let update = Notification.Name.init("update")
    static let rotation = Notification.Name.init("rotation")
}
