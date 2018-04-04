//
//  NSRMainViewController.swift
//  NSRDemoAppJSON
//
//  Created by Nasir Ahmed Momin on 03/04/18.
//  Copyright © 2018 Nasir Ahmed Momin. All rights reserved.
//

import UIKit

class NSRMainViewController: UITableViewController {

    var responseData : ResponseData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSRApiClient.apiClient.initGetRequest(forURL: URL.init(string: API_ENDPOINT)!) { (response) in
            if let response = response {
                let list = response["companies"] as! [[String:Any]]
//                print(list)
                self.responseData = ResponseData(companies: list)
                OperationQueue.main.addOperation {
                    self.tableView.reloadData()
                }
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let res = responseData {
            return res.companies.count
        }
        return 0;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cellId"
        let cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        let company  = responseData?.companies[indexPath.row]
        cell.textLabel?.text = company?.title
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let company  = responseData?.companies[indexPath.row]
        
        let detailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "NSRDetailViewController") as! NSRDetailViewController
        
        detailsViewController.company = company!
        
        self.navigationController?.show(detailsViewController, sender: nil)
    }

}
