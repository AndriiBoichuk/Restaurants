//
//  VendorsView.swift
//  RestaurantsApp
//
//  Created by Andrii Boichuk on 25.04.2023.
//

import SwiftUI

struct VendorsView: View {
    @StateObject private var viewModel: VendorsViewModel = VendorsViewModel()
    
    var body: some View {
        VStack {
            CustomTextField(text: $viewModel.text) {
                viewModel.searchVendors()
            }
            if viewModel.vendors.isEmpty {
                makeEmptyStateView
            } else {
                makeCardsView
            }
        }
        .overlay(alignment: .bottom) {
            if viewModel.isNextPageAvailable {
                Button {
                    viewModel.nextPage()
                } label: {
                    Text("Next page")
                        .font(.restBody)
                        .foregroundColor(.greyPrimary)
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                        .background(Color.darkGreen.opacity(0.4))
                        .cornerRadius(Constants.cornerRadius)
                }
            }
        }
        .padding(.horizontal, Constants.Padding.large)
    }
}

struct VendorsView_Previews: PreviewProvider {
    static var previews: some View {
        VendorsView()
    }
}

// MARK: - View + Constants

extension VendorsView {
    struct Const {
        struct Spacing {
            static let cardSpacing: CGFloat = 24
        }
    }
}

// MARK: - View + Empty

extension VendorsView {
    var makeEmptyStateView: some View {
        VStack(spacing: Constants.Spacing.main) {
            Text("Sorry! No results found...")
                .font(.restTitle)
                .foregroundColor(.darkGreen)
            Text("Please try a different search request or browse businesses from the list")
                .font(.restSubhead)
                .foregroundColor(.greyPrimary)
        }
        .multilineTextAlignment(.center)
        .frame(maxHeight: .infinity)
    }
}

// MARK: - View + Cards

extension VendorsView {
    var makeCardsView: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: Const.Spacing.cardSpacing) {
                ForEach(viewModel.vendors) { vendor in
                    VendorCardView(vendor: vendor)
                }
            }
        }
    }
}
