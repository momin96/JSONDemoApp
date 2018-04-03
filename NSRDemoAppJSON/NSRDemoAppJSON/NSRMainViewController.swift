//
//  NSRMainViewController.swift
//  NSRDemoAppJSON
//
//  Created by Nasir Ahmed Momin on 03/04/18.
//  Copyright © 2018 Nasir Ahmed Momin. All rights reserved.
//

import UIKit

class NSRMainViewController: UITableViewController {

    var responseData = ResponseData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSRApiClient.apiClient.initGetRequest(forURL: URL.init(string: API_ENDPOINT)!) { (response) in
            if let response = response {
                let list = response["companies"] as! [String]
                print(list)
                self.responseData = ResponseData(companies: list)
                OperationQueue.main.addOperation {
                    self.tableView.reloadData()
                }
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = ""
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responseData.companies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cellId"
        let cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        cell.textLabel?.text = responseData.companies[indexPath.row] as String
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let companyName = responseData.companies[indexPath.row] as String
        let detailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "NSRDetailViewController") as! NSRDetailViewController
        self.navigationItem.title = companyName
        self.navigationController?.show(detailsViewController, sender: nil)
    }

}
