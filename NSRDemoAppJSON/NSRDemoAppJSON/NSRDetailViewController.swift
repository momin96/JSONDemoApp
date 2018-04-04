//
//  NSRDetailViewController.swift
//  NSRDemoAppJSON
//
//  Created by Nasir Ahmed Momin on 03/04/18.
//  Copyright © 2018 Nasir Ahmed Momin. All rights reserved.
//

import UIKit

class NSRDetailViewController: UIViewController {

    var company : Company = Company()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var detailImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = company.title

        
        
    }
}
