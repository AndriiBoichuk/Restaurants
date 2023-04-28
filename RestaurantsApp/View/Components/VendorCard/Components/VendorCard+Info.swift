//
//  VendorCard+Info.swift
//  RestaurantsApp
//
//  Created by Andrii Boichuk on 25.04.2023.
//

import SwiftUI

extension VendorCardView {
    private var columns: [GridItem] {
        [.init(.flexible(), spacing: Const.Spacing.category, alignment: .leading),
         .init(.flexible(), spacing: Const.Spacing.category, alignment: .leading)]
    }
    
    var makeInfoView: some View {
        LazyVStack(alignment: .leading, spacing: Const.Spacing.main) {
            Text(vendor.companyName)
                .font(.restHeadline)
                .foregroundColor(.greyPrimary)
            HStack(spacing: Const.Spacing.category) {
                LazyVGrid(columns: columns, alignment: .leading, spacing: Const.Spacing.category) {
                    ForEach(vendor.categories) { category in
                        CategoryView(url: .init(string: category.image.mediaUrl),
                                     category: category.name)
                    }
                }
            }
            Text(vendor.shopType)
                .font(.restBody)
                .foregroundColor(.greySecondary)
        }
    }
}

private extension VendorCardView {
    struct Const {
        struct Spacing {
            static let main: CGFloat = 9
            static let category: CGFloat = 14
        }
    }
}
