//
//  HomeTableController.swift
//  Twitter-Clone
//
//  Created by Emir Alkal on 1.03.2023.
//

import UIKit

final class HomeTableController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        setupNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let height: CGFloat = 100 //whatever height you want to add to the existing height
        let bounds = self.navigationController!.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)
        
    }
    
    private func setupNavigationBar() {
        let leftImage = UIImage(named: "mock-profile")?.withRenderingMode(.alwaysOriginal)
        let centerImage = UIImage(named: "tw-logo")
        let rightImage = UIImage(named: "nav-right")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: leftImage)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightImage)
        navigationItem.titleView = UIImageView(image: centerImage)
    }
}
