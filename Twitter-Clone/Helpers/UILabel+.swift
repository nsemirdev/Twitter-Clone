//
//  UILabel+.swift
//  Twitter-Clone
//
//  Created by Emir Alkal on 2.03.2023.
//

import UIKit

extension UILabel {
    convenience init(font: UIFont, nLines: Int = 0) {
        self.init(frame: .zero)
        self.font = font
        numberOfLines = nLines

    }
    
    convenience init(text: String, font: UIFont, nLines: Int = 0) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        numberOfLines = nLines
    }
    
    convenience init(attrText: NSAttributedString, font: UIFont, nLines: Int = 0) {
        self.init(frame: .zero)
        self.attributedText = attrText
        self.font = font
        numberOfLines = nLines
    }
}
