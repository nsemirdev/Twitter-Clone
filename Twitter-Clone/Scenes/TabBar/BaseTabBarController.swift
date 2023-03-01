//
//  BaseTabBarController.swift
//  Twitter-Clone
//
//  Created by Emir Alkal on 1.03.2023.
//

import UIKit
import SnapKit

final class BaseTabBarController: UITabBarController {

    private let divider = Divider(#colorLiteral(red: 0.7870897651, green: 0.8147261739, blue: 0.8408268094, alpha: 1))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupViewControllers()
    }
    
    private func setupTabBar() {
        tabBar.tintColor = #colorLiteral(red: 0.3590039611, green: 0.6878271699, blue: 0.9382472634, alpha: 1)
        
        tabBar.addSubview(divider)
        
        divider.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(0.5)
        }
    }
    
    private func setupViewControllers() {
        viewControllers = [
            HomeNavigationController(),
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
