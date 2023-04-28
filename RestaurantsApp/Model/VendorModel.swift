//
//  VendorModel.swift
//  RestaurantsApp
//
//  Created by Andrii Boichuk on 25.04.2023.
//

import Foundation

struct VendorModel: Codable, Identifiable {
    let id: Int
    let companyName: String
    let areaServed: String
    let shopType: String
    let favorited: Bool
    let follow: Bool
    let businessType: String
    let coverPhoto: CoverPhotoModel
    let categories: [CategoryModel]
}

extension VendorModel {
    static var mocked: VendorModel {
        .init(id: 24,
              companyName: "Florists + Fashion",
              areaServed: "Newry",
              shopType: "Bike Shop",
              favorited: true,
              follow: false,
              businessType: "virtual",
              coverPhoto: .init(id: 1, mediaUrl: "https://cdn-staging.chatsumer.app/eyJidWNrZXQiOiJjaGF0c3VtZXItZ2VuZXJhbC1zdGFnaW5nLXN0b3JhZ2UiLCJrZXkiOiIxMy84ZjMzZTgyNy0yNzIxLTQ3ZjctYjViNS0zM2Q5Y2E2MTM1OGQuanBlZyJ9"),
              categories: CategoryModel.mocked)
    }
}
