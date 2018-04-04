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
    @IBOutlet weak var activityIndcator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = company.title

        let logoURLString = company.logo
        let imageURLString = company.image
        
        let group = DispatchGroup()
        
        group.enter()
        NSRApiClient.apiClient.downloadAndCachedImage(fromUrl: URL(string: logoURLString!)!) { (image) in
            OperationQueue.main.addOperation {
                if (image != nil) {
                    self.logoImageView.image = image
                }
                group.leave()
            }
        }
        
        group.enter()
        NSRApiClient.apiClient.downloadAndCachedImage(fromUrl: URL(string : imageURLString!)!) { (image) in

//            let imageRenderOperation = Operation()
//            imageRenderOperation.qualityOfService = .userInteractive
//            imageRenderOperation.completionBlock = {
//                self.detailImageView.image = image
//            }
            OperationQueue.main.addOperation {
                if (image != nil) {
                    self.detailImageView.image = image
                }
                group.leave()
            }

//            OperationQueue.main.addOperation(imageRenderOperation)
        }
        
        group.notify(queue: DispatchQueue.main) {
            self.activityIndcator.stopAnimating()
        }
    }
}
