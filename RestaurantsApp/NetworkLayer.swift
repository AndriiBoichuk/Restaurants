//
//  NetworkLayer.swift
//  RestaurantsApp
//
//  Created by Andrii Boichuk on 24.04.2023.
//

import Foundation

protocol NetworkLayer {
    func fetchData(from url: URL) async throws -> Data
}

class MockedNetworkLayer: NetworkLayer {
    func fetchData(from url: URL) async throws -> Data {
        guard url.pathExtension == "json" else {
            throw NetworkError.invalidURL
        }
   
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            throw NetworkError.invalidData
        }
    }
}

enum NetworkError: Error {
    case invalidURL
    case invalidData
}
