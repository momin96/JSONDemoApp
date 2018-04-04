//
//  ResponseData.swift
//  NSRDemoAppJSON
//
//  Created by Nasir Ahmed Momin on 03/04/18.
//  Copyright © 2018 Nasir Ahmed Momin. All rights reserved.
//

import Foundation

struct ResponseData {
    var companies = [Company]()
    
    init(companies : [[String:Any]]) {

//        for company in companies {
//            let name = company["name"] as! String
//            let logo = company["logo"] as! String
//            let image = company["image"] as! String
//            let company = Company(title: name, logo: logo, image: image)
//            self.companies.append(company)
//        }
        
        self.companies = companies.map { (company) -> Company in
        print("company \(company)")
        let name = company["name"] as! String
        let logo = company["logo"] as! String
        let image = company["image"] as! String
        return Company(title: name, logo: logo, image: image)
        }
    }
}

struct Company{
    var title : String?
    var logo : String?
    var image : String?
}
