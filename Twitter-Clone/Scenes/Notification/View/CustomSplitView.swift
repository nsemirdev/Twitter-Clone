//
//  CustomSplitView.swift
//  Twitter-Clone
//
//  Created by Emir Alkal on 2.03.2023.
//

import UIKit
import SnapKit

final class CustomSplitView: UIView {
    
    var selectedButton = 0
    let activeColor = #colorLiteral(red: 0.3590039611, green: 0.6878271699, blue: 0.9382472634, alpha: 1)
    let passiveColor = #colorLiteral(red: 0.4820557833, green: 0.5377379656, blue: 0.5890749693, alpha: 1)
    let bottomView = Divider(#colorLiteral(red: 0.3590039611, green: 0.6878271699, blue: 0.9382472634, alpha: 1))
    
    private lazy var allButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("All", for: .normal)
        button.setTitleColor(activeColor, for: .normal)
        button.titleLabel?.font = .poppin900(size: 16)
        button.addTarget(nil, action: #selector(handleLeft), for: .touchUpInside)
        return button
    }()
    
    private lazy var mentionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Mentions", for: .normal)
        button.setTitleColor(passiveColor, for: .normal)
        button.titleLabel?.font = .poppin900(size: 16)
        button.addTarget(nil, action: #selector(handleRight), for: .touchUpInside)
        return button
    }()
    
    @objc func handleLeft() {
        if selectedButton == 0 {
            return
        }
        allButton.setTitleColor(activeColor, for: .normal)
        mentionsButton.setTitleColor(passiveColor, for: .normal)
        selectedButton = 0
        
        UIView.animate(withDuration: 0.2) {
            self.bottomView.transform = .identity
        }
    }
    
    @objc func handleRight() {
        if selectedButton == 1 {
            return
        }
        allButton.setTitleColor(passiveColor, for: .normal)
        mentionsButton.setTitleColor(activeColor, for: .normal)
        selectedButton = 1
        
        UIView.animate(withDuration: 0.2) {
            self.bottomView.transform = .init(translationX: self.bottomView.frame.size.width, y: 0)
        }
    }
    
    private lazy var buttonStack = HorizontalStack([allButton, mentionsButton])
    
    convenience init() {
        self.init(frame: .zero)
        setupViews()
    }
    
    private func setupViews() {
        addSubviews(buttonStack, bottomView)
        buttonStack.distribution = .fillEqually
        
        buttonStack.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
        
        bottomView.snp.makeConstraints { make in
            make.leading.equalTo(buttonStack.subviews[0].snp.leading)
            make.trailing.equalTo(buttonStack.subviews[0].snp.trailing)
            make.bottom.equalToSuperview()
            make.height.equalTo(2)
        }
    }
}
