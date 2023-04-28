//
//  CategoryModel.swift
//  RestaurantsApp
//
//  Created by Andrii Boichuk on 25.04.2023.
//

import Foundation

struct CategoryModel: Codable, Identifiable {
    let id: Int
    let name: String
    let `image`: CoverPhotoModel
}

extension CategoryModel {
    static var mocked: [CategoryModel] {
        [
            .init(id: 1, name: "Florists", image: .mocked1),
            .init(id: 2, name: "Fashion Accessories", image: .mocked1),
            .init(id: 3, name: "Garden", image: .mocked1)
        ]
    }
}
