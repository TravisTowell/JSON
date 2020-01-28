//
//  DataGetter.swift
//  JSON Test
//
//  Created by Travis Towell on 1/28/20.
//  Copyright © 2020 Travis Towell. All rights reserved.
//

import UIKit

class DataGetter: NSObject {
    
    let MYJSONURL = "https://api.myjson.com/bins/136w0u"
        
        var dataArray = ["No data yet, Captain!"]
        
    func getData(completion: @escaping (_ success: Bool) ->()) {
        var success = true
        
        let actualUrl = URL(string: MYJSONURL)
        let task = URLSession.shared.dataTask(with: actualUrl!){
            (data, response, error) in
        
        guard let _ = data, error == nil else {
            // big error
            success = false
            return
        }
        
        if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
            print(jsonObj.value(forKey: "characters")!)
            
            if let veggieArray = jsonObj.value(forKey:
                "characters") as? Array<String> {
                self.dataArray = veggieArray
            }
        }
        }
    }
}
