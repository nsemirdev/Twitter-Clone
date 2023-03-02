//
//  SearchNavController.swift
//  Twitter-Clone
//
//  Created by Emir Alkal on 2.03.2023.
//

import UIKit
import SnapKit

final class SearchNavigationController: UINavigationController {
    
    private let addTextButton = UIButton(imageName: "add-text")
    private let profileButton = UIButton(imageName: "mock-profile")
    private let settingsButton = UIButton(imageName: "settings")
    private let divider = Divider(#colorLiteral(red: 0.7870897651, green: 0.8147261739, blue: 0.8408268094, alpha: 1))
    private let textField = SearchTextField()
    
    convenience init() {
        self.init(rootViewController: SearchController())
        tabBarItem.image = UIImage(named: "search")
        tabBarItem.selectedImage = UIImage(named: "search-selected")
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
        navigationBar.addSubviews(profileButton, textField, settingsButton, divider)
        
        profileButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(24)
            make.width.height.equalTo(32)
        }
        
        settingsButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-24)
            make.width.height.equalTo(32)
        }
        
        textField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(profileButton.snp.trailing).offset(18)
            make.trailing.equalTo(settingsButton.snp.leading).offset(-18)
            make.height.equalTo(36)
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
    }
}

