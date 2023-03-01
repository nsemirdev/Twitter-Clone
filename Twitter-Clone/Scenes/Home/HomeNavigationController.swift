//
//  HomeNavigationController.swift
//  Twitter-Clone
//
//  Created by Emir Alkal on 1.03.2023.
//

import UIKit
import SnapKit

final class HomeNavigationController: UINavigationController {
    
    private let profileButton = UIButton(imageName: "mock-profile")
    private let exploreButton = UIButton(imageName: "nav-right")
    private let twLogo = UIImageView(image: UIImage(named: "tw-logo"))
    private let divider = Divider(.gray)
    
    convenience init() {
        self.init(rootViewController: HomeTableController())
        tabBarItem.image = UIImage(named: "home")
        tabBarItem.selectedImage = UIImage(named: "home-selected")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationBar.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: UIScreen.main.bounds.width, height: 60)
    }
    
    private func setupViews() {
        navigationBar.addSubviews(profileButton, twLogo, exploreButton, divider)
        
        profileButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(24)
        }
        
        twLogo.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        exploreButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-24)
        }
        
        divider.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(0.5)
        }
    }
}
