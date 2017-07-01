//
//  Section.swift
//  MoneyKeeper
//
//  Created by Tran Chung on 6/28/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

//import Foundation
//
//typealias JSON = Dictionary<AnyHashable,Any>
//
//struct Section {
//    var arraySections: [InfomationSection] = []
//    init?(json: JSON) {
//        guard let results = json["result"] as? [JSON] else { return nil }
//        for result in results {
//            if let section = InfomationSection(json: result) {
//                arraySections.append(section)
//            }
//        }
//    }
//}
//
//class InfomationSection {
//    var nameSection: String
//    var arrayCells: [InfomationCell] = []
//    init?(json: JSON) {
//        nameSection = json["name"] as! String
//        guard let cells = json["cell"] as? [JSON] else { return nil }
//        for itemCell in cells {
//            if let cell = InfomationCell(json: itemCell) {
//                arrayCells.append(cell)
//            }
//        }
//    }
//}
//
//class InfomationCell {
//    var nameCell: String
//    
//    init?(json: JSON) {
//        nameCell = json["name_c"] as! String
//    }
//}
