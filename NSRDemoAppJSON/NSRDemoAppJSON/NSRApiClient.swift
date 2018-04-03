//
//  NSRApiClient.swift
//  NSRDemoAppJSON
//
//  Created by Nasir Ahmed Momin on 03/04/18.
//  Copyright © 2018 Nasir Ahmed Momin. All rights reserved.
//

import UIKit

let API_ENDPOINT = "https://api.myjson.com/bins/vi56v"

class NSRApiClient: NSObject {

    static let apiClient = NSRApiClient()
    
    func initGetRequest(forURL url : URL, onCompletion : @escaping ([String : Any]?) -> Void) {
        
        let sessionConfiguration = URLSessionConfiguration.default
        let urlSession = URLSession(configuration: sessionConfiguration)
        
        let dataTask = urlSession.dataTask(with: url) { (data, response, error) in
        
            let httpResponse = response as! HTTPURLResponse
            
            if error == nil && httpResponse.statusCode == 200 && data != nil{
                let jsonData = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any]
                onCompletion(jsonData!)
            }
            else {
                onCompletion(nil)
            }
            
        }
        dataTask.resume()
    }
}