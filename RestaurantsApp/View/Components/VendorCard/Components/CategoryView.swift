//
//  CategoryView.swift
//  RestaurantsApp
//
//  Created by Andrii Boichuk on 25.04.2023.
//

import SwiftUI
import SVGKit

struct CategoryView: View {
    let url: URL?
    let category: String
    
    var svgImage: SVGKImage? {
        guard let url else {
            return nil
        }
        return .init(contentsOf: url)
    }
    
    var body: some View {
        HStack {
            if let svgImage {
                SVGView(svgImage: svgImage)
                    .frame(width: Const.Width.icon)
                    .padding(.horizontal, Constants.Padding.large)
            }
            Text(category)
                .font(.restBody)
                .foregroundColor(.greyPrimary)
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(url: .init(string: "https://media-staging.chatsumer.app/48/1830f855-6315-4d3c-a5dc-088ea826aef2.svg"),
                     category: "Florists")
    }
}

extension CategoryView {
    struct Const {
        struct Width {
            static let icon: CGFloat = 4
        }
    }
}
