//
//  BaseTabBarController.swift
//  Twitter-Clone
//
//  Created by Emir Alkal on 1.03.2023.
//

import UIKit

final class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        tabBar.tintColor = #colorLiteral(red: 0.3590039611, green: 0.6878271699, blue: 0.9382472634, alpha: 1)
    }
    
    private func setupViewControllers() {
        viewControllers = [
            createNavController(viewController: HomeTableController(), imageName: "home"),
            createNavController(viewController: SearchController(), imageName: "search"),
            createNavController(viewController: NotificationTableController(), imageName: "notification"),
            createNavController(viewController: MessageTableController(), imageName: "message")
        ]
    }
    
    private func createNavController(viewController: UIViewController, imageName: String) -> UINavigationController {
        let navVC = UINavigationController(rootViewController: viewController)
        navVC.tabBarItem.image = UIImage(named: imageName)
        navVC.tabBarItem.selectedImage = UIImage(named: "\(imageName)-selected")
        return navVC
    }
}
