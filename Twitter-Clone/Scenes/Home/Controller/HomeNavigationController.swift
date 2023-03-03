//
//  HomeNavigationController.swift
//  Twitter-Clone
//
//  Created by Emir Alkal on 1.03.2023.
//

import UIKit
import SnapKit

final class HomeNavigationController: UINavigationController {
    
    private let addTextButton = UIButton(imageName: "add-text")
    private let profileButton = UIButton(imageName: "mock-profile")
    private let exploreButton = UIButton(imageName: "nav-right")
    private let twLogo = UIImageView(image: UIImage(named: "tw-logo"))
    private let divider = Divider(#colorLiteral(red: 0.7870897651, green: 0.8147261739, blue: 0.8408268094, alpha: 1))
    
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
        
        view.addSubview(addTextButton)
        
        addTextButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-12)
            make.trailing.equalToSuperview().offset(-12)
        }
        
        addTextButton.addTarget(self, action: #selector(handleAddTweet), for: .touchUpInside)
    }
    
    @objc func handleAddTweet() {
        let tweetController = TweetController()
        tweetController.modalPresentationStyle = .fullScreen
        present(tweetController, animated: true)
    }
}
