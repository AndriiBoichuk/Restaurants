//
//  VendorCardView.swift
//  RestaurantsApp
//
//  Created by Andrii Boichuk on 25.04.2023.
//

import SwiftUI

struct VendorCardView: View {
    let vendor: VendorModel
    
    var body: some View {
        VStack {
            makeImagePartView
            makeInfoView
        }
    }
}

struct VendorCardView_Previews: PreviewProvider {
    static var previews: some View {
        VendorCardView(vendor: .mocked)
    }
}

extension VendorCardView {
    
}
