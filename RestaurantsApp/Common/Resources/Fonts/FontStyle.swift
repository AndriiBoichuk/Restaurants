//
//  FontStyle.swift
//  RestaurantsApp
//
//  Created by Andrii Boichuk on 24.04.2023.
//

import SwiftUI

typealias ProjectFont = Font

extension ProjectFont {
    static let restSubhead = OpenSans().regular(size: 16, relativeTo: .subheadline)
    static let restBody = OpenSans().regular(size: 14, relativeTo: .body)
    static let restHeadline = OpenSans().bold(size: 16, relativeTo: .headline)
    static let restTitle = OpenSans().bold(size: 24, relativeTo: .title)
}
