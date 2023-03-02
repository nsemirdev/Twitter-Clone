//
//  SearchTextField.swift
//  Twitter-Clone
//
//  Created by Emir Alkal on 2.03.2023.
//

import UIKit

final class SearchTextField: UITextField {

    convenience init() {
        self.init(frame: .zero)
        backgroundColor = #colorLiteral(red: 0.9242289662, green: 0.9405881763, blue: 0.9531721473, alpha: 1)
        clipsToBounds = true
        layer.cornerRadius = 16
        textAlignment = .center
        let imageView = UIImageView(image: .init(named: "search"))
        addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(30)
            make.width.height.equalTo(13)
        }
        
        let colorLiteral = #colorLiteral(red: 0.4820557833, green: 0.5377379656, blue: 0.5890749693, alpha: 1)
        attributedPlaceholder = NSAttributedString(
            string: "Search Twitter",
            attributes: [NSAttributedString.Key.foregroundColor: colorLiteral]
        )
        

    }
}
