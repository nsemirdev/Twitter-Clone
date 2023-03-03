//
//  TweetController.swift
//  Twitter-Clone
//
//  Created by Emir Alkal on 3.03.2023.
//

import UIKit

final class TweetController: UIViewController, UITextViewDelegate {
    private lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { _ in
            self.dismiss(animated: true)
        }))
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = .poppin400(size: 17)
        return button
    }()
    
    private let actionButton: UIButton = {
        let button = UIButton(type: .system)
        var conf = UIButton.Configuration.plain()

        conf.titlePadding = 8
        conf.attributedTitle = AttributedString(
            "Tweet",
            attributes: AttributeContainer([
                NSAttributedString.Key.font : UIFont.poppin900(size: 14),
                NSAttributedString.Key.foregroundColor: UIColor.white
            ]))

        button.configuration = conf
        button.backgroundColor = #colorLiteral(red: 0.3590039611, green: 0.6878271699, blue: 0.9382472634, alpha: 1)
        button.layer.cornerRadius = 18
        return button
    }()
    
    private let profileImage = UIImageView(image: UIImage(named: "mock-profile"))
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.text = "What’s happening?"
        textView.font = .poppin400(size: 19)
        textView.textColor = #colorLiteral(red: 0.4820557833, green: 0.5377379656, blue: 0.5890749693, alpha: 1)
        return textView
    }()
    
    private let images = [
        UIImageView(image: UIImage(named: "stack1")),
        UIImageView(image: UIImage(named: "stack2")),
        UIImageView(image: UIImage(named: "stack3")),
        UIImageView(image: UIImage(named: "stack4")),
        UIImageView(image: UIImage(named: "stack5")),
    ]
    
    private lazy var horizontalStack = HorizontalStack([], spacing: 8)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupStack()
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillShown(_:)),name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector:
        #selector(keyboardWillBeHidden),name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShown(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            print(keyboardHeight)
            
            UIView.animate(withDuration: 0.2) {
                self.horizontalStack.transform = .init(translationX: 0, y: -keyboardHeight)
            }
        }
    }
    
    @objc func keyboardWillBeHidden() {
        UIView.animate(withDuration: 0.2) {
            self.horizontalStack.transform = .identity
        }
    }
    
    private func setupStack() {
        images.forEach { iv in
            iv.snp.makeConstraints { make in
                make.width.height.equalTo(78)
            }
            iv.layer.cornerRadius = 17
            iv.clipsToBounds = true
            iv.contentMode = .center
            horizontalStack.addArrangedSubview(iv)
        }
    }
    
    private func setupViews() {
        view.addSubviews(cancelButton, actionButton, profileImage, textView, horizontalStack)
        
        actionButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-21)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(21)
            make.width.equalTo(70)
            make.height.equalTo(35)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(21)
            make.centerY.equalTo(actionButton.snp.centerY)
        }
        
        profileImage.snp.makeConstraints { make in
            make.leading.equalTo(cancelButton.snp.leading)
            make.top.equalTo(cancelButton.snp.bottom).offset(10)
            make.width.height.equalTo(37)
        }
        
        textView.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.top)
            make.leading.equalTo(profileImage.snp.trailing).offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.bottom.equalTo(view.snp.centerY)
        }
        
        horizontalStack.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        horizontalStack.distribution = .fillEqually
        actionButton.addTarget(self, action: #selector(handleTweetButton), for: .touchUpInside)
        textView.delegate = self
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
    @objc func handleTweetButton() {
        dismiss(animated: true)
    }
}
