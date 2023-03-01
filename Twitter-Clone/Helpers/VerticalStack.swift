//
//  VerticalStack.swift
//  Twitter-Clone
//
//  Created by Emir Alkal on 2.03.2023.
//

import UIKit

final class VerticalStack: UIStackView {
    convenience init(_ subviews: [UIView], spacing: CGFloat = 4) {
        self.init(arrangedSubviews: subviews)
        axis = .vertical
        self.spacing = spacing
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
