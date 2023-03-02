//
//  SearchController.swift
//  Twitter-Clone
//
//  Created by Emir Alkal on 1.03.2023.
//

import UIKit
import SnapKit

final class SearchController: UIViewController {

    private let titleLabel = UILabel(text: "Trends For You", font: .poppin900(size: 19))
    private let topDivider = Divider(#colorLiteral(red: 0.7870897651, green: 0.8147261739, blue: 0.8408268094, alpha: 1))
    private let bottomDivider = Divider(#colorLiteral(red: 0.7870897651, green: 0.8147261739, blue: 0.8408268094, alpha: 1))
    private let innerTitleLabel = UILabel(text: "No new trends for you", font: .poppin900(size: 22))
    private let bodyLabel = UILabel(text: "It seems like there’s not a lot to show you right now, but you can see trends for other areas", font: .poppin400(size: 16))
    private let actionButton: UIButton = {
        let button = UIButton(type: .system)
        var conf = UIButton.Configuration.plain()

        conf.titlePadding = 8
        conf.attributedTitle = AttributedString(
            "Change location",
            attributes: AttributeContainer([
                NSAttributedString.Key.font : UIFont.poppin900(size: 14),
                NSAttributedString.Key.foregroundColor: UIColor.white
            ]))

        button.configuration = conf
        button.backgroundColor = #colorLiteral(red: 0.3590039611, green: 0.6878271699, blue: 0.9382472634, alpha: 1)
        button.layer.cornerRadius = 16
        return button
    }()
    
    private let dummyView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9242289662, green: 0.9405881763, blue: 0.9531721473, alpha: 1)
        return view
    }()
    
    private lazy var stackView = VerticalStack([innerTitleLabel, bodyLabel, actionButton], spacing: 8)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        view.addSubviews(titleLabel, topDivider, stackView, bottomDivider, dummyView)
        stackView.alignment = .center
        bodyLabel.textAlignment = .center
        bodyLabel.textColor = #colorLiteral(red: 0.4820557833, green: 0.5377379656, blue: 0.5890749693, alpha: 1)
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(21 + 12)
        }
        
        topDivider.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(0.5)
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
        }
        
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(34)
            make.trailing.equalToSuperview().offset(-34)
            make.top.equalTo(topDivider.snp.bottom).offset(34)
        }
        
        bottomDivider.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(0.5)
            make.top.equalTo(stackView.snp.bottom).offset(37)
        }
        
        dummyView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(bottomDivider.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
