//
//  DataService.swift
//  MoneyKeeper
//
//  Created by Tran Chung on 6/28/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import Foundation

class DataServices {
    static let shared: DataServices = DataServices()
    var sectionCategories: Section?
  
    func sectionAtCurrent(json: String) {
        let url = Bundle.main.url(forResource: json, withExtension: "json")
        let urlRequest = URLRequest(url: url!)
        makeDataTaskRequest(request: urlRequest) {
            self.sectionCategories = Section(json: $0)
            NotificationCenter.default.post(name: NotificationKey.update, object: nil)
        }
    }
    private func makeDataTaskRequest(request: URLRequest, completedBlock: @escaping (JSON) -> Void ) {
//        let data2 = NSData(contentsOf: url!)

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            guard let jsonObject =  try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) else {
                return
            }
            guard let json = jsonObject as? JSON else {
                return
            }
            DispatchQueue.main.async {
                completedBlock(json)
            }
        }
        task.resume()
    }
}
