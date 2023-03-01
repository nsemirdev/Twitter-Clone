//
//  PostCell.swift
//  Twitter-Clone
//
//  Created by Emir Alkal on 1.03.2023.
//

import UIKit
import SnapKit

final class PostCell: UITableViewCell {
    
    private let profileImage = UIImageView()
    private let divider = Divider(#colorLiteral(red: 0.7870897651, green: 0.8147261739, blue: 0.8408268094, alpha: 1))
    private let nameLabel = UILabel(font: .poppin900(size: 16), nLines: 1)
    private let usernameLabel = UILabel(font: .poppin500(size: 16))
    private let timePassedLabel = UILabel(font: .poppin400(size: 16))
    private let bodyLabel = UILabel(font: .poppin400(size: 16))
    private let commentButton = UIButton(imageName: "comment")
    private let rtButton = UIButton(imageName: "retweet")
    private let likeButton = UIButton(imageName: "heart")
    private let shareButton = UIButton(imageName: "share")
    
    private lazy var labelsStack = HorizontalStack([nameLabel, usernameLabel, timePassedLabel])
    private lazy var buttonsStack = HorizontalStack([commentButton, rtButton, likeButton, shareButton])
    private lazy var overallStackview = VerticalStack([labelsStack, bodyLabel, buttonsStack], spacing: 6)
    
    func configure(with post: Post) {
        profileImage.image = UIImage(named: post.profileImage)
        nameLabel.text = post.name
        nameLabel.textColor = #colorLiteral(red: 0.1010758653, green: 0.1133193746, blue: 0.1299102902, alpha: 1)
        usernameLabel.text = post.userId
        usernameLabel.textColor = #colorLiteral(red: 0.4820557833, green: 0.5377379656, blue: 0.5890749693, alpha: 1)
        timePassedLabel.text = "·\(post.timePassed)"
        timePassedLabel.textColor = #colorLiteral(red: 0.4820557833, green: 0.5377379656, blue: 0.5890749693, alpha: 1)
        bodyLabel.text = post.body
        bodyLabel.textColor = #colorLiteral(red: 0.1010758653, green: 0.1133193746, blue: 0.1299102902, alpha: 1)
        
        let colorLiteral = UIColor(red: 0.4820557833, green: 0.5377379656, blue: 0.5890749693, alpha: 1)
        var conf = UIButton.Configuration.plain()
        conf.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        conf.imagePadding = 2
        
        commentButton.setTitle("\(post.commentCount)", for: .normal)
        commentButton.setTitleColor(colorLiteral, for: .normal)
        commentButton.configuration = conf
        rtButton.setTitle("\(post.rtCount)", for: .normal)
        rtButton.setTitleColor(colorLiteral, for: .normal)
        rtButton.configuration = conf
        likeButton.setTitle("\(post.likeCount)", for: .normal)
        likeButton.setTitleColor(colorLiteral, for: .normal)
        likeButton.configuration = conf
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubviews(profileImage, overallStackview, divider)
        labelsStack.alignment = .bottom
        overallStackview.alignment = .fill
        buttonsStack.distribution = .equalSpacing
        
        profileImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(overallStackview.snp.top)
            make.width.height.equalTo(55)
        }
        
        overallStackview.snp.makeConstraints { make in
            make.leading.equalTo(profileImage.snp.trailing).offset(12)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(13)
            make.bottom.equalToSuperview().offset(-13)
        }
        
        divider.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(0.5)
        }
    }
}
