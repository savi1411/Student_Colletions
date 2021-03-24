//
//  PhotoInfo.swift
//  SpacePhoto
//
//  Created by Carlos Alberto Savi on 19/03/21.
//

import Foundation

struct PhotoInfo: Codable {
    var title: String
    var description: String
    var url: URL
    var copyright: String?

    enum CodingKeys: String, CodingKey {
        case title
        case description = "explanation"
        case url
        case copyright
    }
}

