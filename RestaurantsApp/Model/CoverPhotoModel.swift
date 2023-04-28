//
//  CoverPhotoModel.swift
//  RestaurantsApp
//
//  Created by Andrii Boichuk on 25.04.2023.
//

import Foundation

struct CoverPhotoModel: Codable, Identifiable {
    let id: Int
    let mediaUrl: String
}

extension CoverPhotoModel {
    static var mocked1: CoverPhotoModel {
        .init(id: 1, mediaUrl: "https://media-staging.chatsumer.app/48/1830f855-6315-4d3c-a5dc-088ea826aef2.svg")
    }
    
    static var mocked2: CoverPhotoModel {
        .init(id: 2, mediaUrl: "https://media-staging.chatsumer.app/48/1830f855-6315-4d3c-a5dc-088ea826aef2.svg")
    }
    
    static var mocked3: CoverPhotoModel {
        .init(id: 3, mediaUrl: "https://media-staging.chatsumer.app/48/1830f855-6315-4d3c-a5dc-088ea826aef2.svg")
    }
}
