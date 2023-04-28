//
//  SVGView.swift
//  RestaurantsApp
//
//  Created by Andrii Boichuk on 28.04.2023.
//

import SwiftUI
import SVGKit

struct SVGView: UIViewRepresentable {
    let svgImage: SVGKImage

    func makeUIView(context: Context) -> UIView {
        let svgView = SVGKFastImageView(svgkImage: svgImage)!
        svgView.contentMode = .scaleAspectFit
        return svgView
    }

    func updateUIView(_ uiView: UIView, context: Context) { }
}
