//
//  UIButton+.swift
//  Twitter-Clone
//
//  Created by Emir Alkal on 1.03.2023.
//

import UIKit

extension UIButton {
    convenience init(imageName: String) {
        self.init(type: .system)
        let image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        setImage(image, for: .normal)
    }
}
