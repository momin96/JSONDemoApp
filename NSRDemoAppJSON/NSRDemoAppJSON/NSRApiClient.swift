//
//  NSRApiClient.swift
//  NSRDemoAppJSON
//
//  Created by Nasir Ahmed Momin on 03/04/18.
//  Copyright © 2018 Nasir Ahmed Momin. All rights reserved.
//

import UIKit



let API_ENDPOINT = "https://api.myjson.com/bins/psqy3"  //https://api.myjson.com/bins/vi56v"

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
    // https://api.myjson.com/bins/15xko3
    // https://pastebin.com/rdV8thr5
    func downloadAndCachedImage(fromUrl url : URL, onCompletion : @escaping (UIImage?) ->Void) {
        
        let urlRequest = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 2) // Will be changing timeout very frequently
        let ephemeralConfguration = URLSessionConfiguration.background(withIdentifier: "com.randomtext.myidentifier")
        
        let session = URLSession(configuration: ephemeralConfguration)
        
        let downloadTask = session.downloadTask(with: urlRequest) { (fileURL, urlResponse, err) in
            
            if let file = fileURL, let urlResponse = urlResponse {
                let data = try? Data.init(contentsOf: file)
//                CachedURLResponse(response: urlResponse, data: , userInfo: nil, storagePolicy: .allowed)
            }
            
            
        }
        
        downloadTask.resume()
    }
    
    
}
