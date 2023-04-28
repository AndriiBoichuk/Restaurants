//
//  VendorsService.swift
//  RestaurantsApp
//
//  Created by Andrii Boichuk on 26.04.2023.
//

import Foundation

protocol VendorsServiceProtocol {
    func fetchVendors(for word: String?, limit: Int?, page: Int) async throws -> [VendorModel]
}

final class VendorsService {
    @Inject
    private var networkLayer: NetworkLayer
    private let filename: String
    
    init(filename: String = "vendors") {
        self.filename = filename
    }
}

extension VendorsService: VendorsServiceProtocol {
    func fetchVendors(for word: String? = nil, limit: Int?, page: Int = 0) async throws -> [VendorModel] {
        guard let jsonURL = Bundle.main.url(forResource: filename, withExtension: "json") else {
            return []
        }
        let data = try await networkLayer.fetchData(from: jsonURL)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decodedData = try decoder.decode(VendorsModel.self, from: data)
        var vendors = decodedData.vendors
        if let word {
            vendors = vendors.filter { $0.companyName.lowercased().contains(word.lowercased()) }
        }
        if let limit {
            if page * limit <= vendors.count {
                let firstPart = vendors.suffix(from: page * limit)
                let filtered = firstPart.prefix(limit)
                return Array(filtered)
            } else {
                return vendors
            }
        }
        return vendors
    }
    
    
}
