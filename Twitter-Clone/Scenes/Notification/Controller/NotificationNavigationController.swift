//
//  NotificationNavigationController.swift
//  Twitter-Clone
//
//  Created by Emir Alkal on 2.03.2023.
//

import UIKit
import SnapKit

final class NotificationNavigationController: UINavigationController {
    private let addTextButton = UIButton(imageName: "add-text")
    private let profileButton = UIButton(imageName: "mock-profile")
    private let settingsButton = UIButton(imageName: "settings")
    private let divider = Divider(#colorLiteral(red: 0.7870897651, green: 0.8147261739, blue: 0.8408268094, alpha: 1))
    private let titleLabel = UILabel(text: "Notifications", font: .poppin900(size: 17))
    private let splitView = CustomSplitView()
    var customDelegate: CustomSplitViewDelegate?
    
    convenience init() {
        self.init(rootViewController: NotificationController())
        tabBarItem.image = UIImage(named: "notification")
        tabBarItem.selectedImage = UIImage(named: "notification-selected")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitView.delegate = self
        setupViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationBar.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: UIScreen.main.bounds.width, height: 88 + 44)
    }
    
    private func setupViews() {
        navigationBar.addSubviews(profileButton, titleLabel, settingsButton, divider, splitView)
        
        profileButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-25)
            make.leading.equalToSuperview().offset(24)
            make.width.height.equalTo(32)
        }
        
        settingsButton.snp.makeConstraints { make in
            make.centerY.equalTo(profileButton.snp.centerY)
            make.trailing.equalToSuperview().offset(-24)
            make.width.height.equalTo(32)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(profileButton.snp.centerY)
            make.centerX.equalToSuperview()
        }
        
        divider.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        splitView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(profileButton.snp.bottom).offset(6)
            make.bottom.equalToSuperview()
        }
        
        view.addSubview(addTextButton)
        
        addTextButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-12)
            make.trailing.equalToSuperview().offset(-12)
        }
    }
}

extension NotificationNavigationController: CustomSplitViewDelegate {
    func didSelectMentions() {
        customDelegate?.didSelectMentions()
    }
    
    func didSelectAll() {
        customDelegate?.didSelectAll()
    }
}

