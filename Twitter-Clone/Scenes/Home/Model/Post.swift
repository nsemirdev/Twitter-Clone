//
//  Post.swift
//  Twitter-Clone
//
//  Created by Emir Alkal on 1.03.2023.
//

import Foundation

struct Post {
    let profileImage: String
    let name: String
    let userId: String
    let timePassed: Int
    let body: String
    let likeCount, rtCount, commentCount: Int
}
