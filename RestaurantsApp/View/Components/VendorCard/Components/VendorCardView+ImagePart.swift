//
//  VendorCardView+ImagePart.swift
//  RestaurantsApp
//
//  Created by Andrii Boichuk on 25.04.2023.
//

import SwiftUI

extension VendorCardView {
    private var saveIcon: Image {
        vendor.favorited ? .saveActive : .saveInactive
    }
    
    var makeImagePartView: some View {
        AsyncImage(url: .init(string: vendor.coverPhoto.mediaUrl)) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            Color.gray
        }
        .frame(height: Const.Height.vendorImage)
        .cornerRadius(Constants.cornerRadius)
        .overlay(alignment: .topTrailing) {
            saveIcon
                .resizable()
                .scaledToFit()
                .frame(height: Const.Height.saveIcon)
                .padding(Const.Padding.saveIcon)
        }
        .overlay(alignment: .bottomLeading) {
            Text(vendor.areaServed)
                .font(.restBody)
                .foregroundColor(.greyPrimary)
                .padding(.vertical, Const.Padding.smallVertical)
                .padding(.horizontal, Constants.Padding.small)
                .background(Color.white.opacity(Const.opacity))
                .cornerRadius(.infinity)
                .padding(Constants.Padding.small)
        }
    }
}

private extension VendorCardView {
    struct Const {
        static let opacity: CGFloat = 0.9
        
        struct Height {
            static let vendorImage: CGFloat = 170
            static let saveIcon: CGFloat = 36
        }
        
        struct Padding {
            static let saveIcon: CGFloat = 10
            static let smallVertical: CGFloat = 2
        }
    }
}
