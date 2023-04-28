//
//  Resolver.swift
//  RestaurantsApp
//
//  Created by Andrii Boichuk on 29.04.2023.
//

import Foundation
import Swinject

class Resolver {
    static let shared = Resolver()
    private let container = buildContainer()

    func resolve<T>(_ type: T.Type) -> T {
        container.resolve(T.self)!
    }
}

func buildContainer() -> Container {
    let container = Container()

    container
        .register(NetworkLayer.self) { _  in MockedNetworkLayer() }.inObjectScope(.container)
    container
        .register(VendorsServiceProtocol.self) { _  in VendorsService() }.inObjectScope(.container)

    return container
}
