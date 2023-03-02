//
//  NotificationCell.swift
//  Twitter-Clone
//
//  Created by Emir Alkal on 2.03.2023.
//

import UIKit
import SnapKit

final class NotificationCell: UITableViewCell {
    
    private let star = UIImageView(image: UIImage(named: "star"))
    private let profileImage = UIImageView()
    private let bodyLabel = UILabel(font: .poppin400(size: 16), nLines: 0)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    func configure(with notification: Notification) {
        profileImage.image = UIImage(named: notification.image)
        bodyLabel.text = notification.text
    }
    
    private func setupViews() {
        contentView.addSubviews(star, profileImage, bodyLabel)
        
        star.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(51)
            make.width.height.equalTo(24)
        }
        
        profileImage.snp.makeConstraints { make in
            make.leading.equalTo(star.snp.trailing).offset(8)
            make.top.equalTo(star.snp.top)
            make.width.height.equalTo(37)
        }
        
        bodyLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImage.snp.leading)
            make.top.equalTo(profileImage.snp.bottom).offset(8)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
