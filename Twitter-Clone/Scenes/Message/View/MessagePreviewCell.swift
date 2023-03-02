//
//  MessagePreviewCell.swift
//  Twitter-Clone
//
//  Created by Emir Alkal on 2.03.2023.
//

import UIKit

final class MessagePreviewCell: UITableViewCell {
    
    private let profileImage = UIImageView()
    private let nameLabel = UILabel(font: .poppin900(size: 16), nLines: 1)
    private let usernameLabel = UILabel(font: .poppin400(size: 16), nLines: 1)
    private let messageLabel = UILabel(font: .poppin400(size: 14), nLines: 2)
    private let dateLabel = UILabel(font: .poppin400(size: 16))
    private let divider = Divider(#colorLiteral(red: 0.7870897651, green: 0.8147261739, blue: 0.8408268094, alpha: 1))
    
    private lazy var labelsStack = HorizontalStack([nameLabel, usernameLabel])
    
    func configure(with message: MessagePreview) {
        profileImage.image = UIImage(named: message.image)
        nameLabel.text = message.name
        usernameLabel.text = message.userId
        messageLabel.text = message.body
        dateLabel.text = message.date
        
        nameLabel.textAlignment = .left
        usernameLabel.textAlignment = .left
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        nameLabel.textColor = #colorLiteral(red: 0.1010758653, green: 0.1133193746, blue: 0.1299102902, alpha: 1)
        usernameLabel.textColor = #colorLiteral(red: 0.4820557833, green: 0.5377379656, blue: 0.5890749693, alpha: 1)
        messageLabel.textColor = #colorLiteral(red: 0.4820557833, green: 0.5377379656, blue: 0.5890749693, alpha: 1)
        dateLabel.textColor = #colorLiteral(red: 0.4820557833, green: 0.5377379656, blue: 0.5890749693, alpha: 1)
    }
    
    private func setupViews() {
        contentView.addSubviews(profileImage, dateLabel, divider, labelsStack, messageLabel)
        
        profileImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.bottom.equalToSuperview().offset(-12)
            make.leading.equalToSuperview().offset(20)
            make.width.height.equalTo(55)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-12)
            make.top.equalTo(labelsStack.snp.top)
        }
        
        divider.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        labelsStack.snp.makeConstraints { make in
            make.leading.equalTo(profileImage.snp.trailing).offset(12)
            make.top.equalTo(profileImage.snp.top).offset(-5)
            make.trailing.equalTo(dateLabel.snp.leading).offset(-8)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.leading.equalTo(labelsStack.snp.leading)
            make.trailing.equalToSuperview().offset(-8)
            make.top.equalTo(labelsStack.snp.bottom).offset(3)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
