//
//  Font.swift
//  RestaurantsApp
//
//  Created by Andrii Boichuk on 24.04.2023.
//

import SwiftUI

protocol FontFamily {
    func bold(size: CGFloat, relativeTo textStyle: Font.TextStyle) -> Font
    func regular(size: CGFloat, relativeTo textStyle: Font.TextStyle) -> Font
}
let notImplemented = "No implementation"
extension FontFamily {
    func bold(size: CGFloat, relativeTo textStyle: Font.TextStyle) -> Font { fatalError(notImplemented) }
    func regular(size: CGFloat, relativeTo textStyle: Font.TextStyle) -> Font { fatalError(notImplemented) }
}

struct OpenSans: FontFamily {
    func regular(size: CGFloat, relativeTo textStyle: Font.TextStyle) -> Font {
        .custom("OpenSans-Regular", size: size, relativeTo: textStyle)
    }
    
    func bold(size: CGFloat, relativeTo textStyle: Font.TextStyle) -> Font {
        .custom("OpenSans-Bold", size: size, relativeTo: textStyle)
    }
}
