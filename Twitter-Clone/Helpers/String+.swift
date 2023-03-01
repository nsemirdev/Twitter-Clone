//
//  String+.swift
//  Twitter-Clone
//
//  Created by Emir Alkal on 2.03.2023.
//

import Foundation

extension String {
    static func *(_ str: String, _ x: Int) -> String {
        var result = ""
    
        (0..<x).forEach { _ in
            result += str
        }
        
        return result
    }
}
