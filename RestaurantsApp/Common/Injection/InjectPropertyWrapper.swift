//
//  InjectPropertyWrapper.swift
//  RestaurantsApp
//
//  Created by Andrii Boichuk on 29.04.2023.
//

import Foundation

@propertyWrapper
struct Inject<Component> {
    let wrappedValue: Component
    init() {
        self.wrappedValue = Resolver.shared.resolve(Component.self)
    }
}
