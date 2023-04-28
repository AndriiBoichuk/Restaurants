//
//  VendorsViewModel.swift
//  RestaurantsApp
//
//  Created by Andrii Boichuk on 26.04.2023.
//

import Foundation
import Combine

final class VendorsViewModel: ObservableObject {
    @Published var text: String = ""
    @Published var vendors: [VendorModel] = []
    @Published var isNextPageAvailable: Bool = false
    
    private var currentPage: Int = 0
    private let vendorsService: VendorsServiceProtocol
    
    private let vendorsPerPage: Int
    
    init(vendorsService: VendorsServiceProtocol = VendorsService(), vendorsPerPage: Int = 1) {
        self.vendorsService = vendorsService
        self.vendorsPerPage = vendorsPerPage
        
        Task {
            await fetchData()
        }
        
        $text
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .filter { $0.count > 2 }
            .sink { searchText in
                self.currentPage = 0
                Task {
                    await self.fetchData(with: searchText)
                }
            }
            .store(in: &cancellables)
    }
    
    
    private var cancellables = Set<AnyCancellable>()
    
    private func fetchData(with word: String? = nil) async {
        let vendors = try? await vendorsService.fetchVendors(for: word, limit: vendorsPerPage + 1, page: currentPage)
            if vendors?.count ?? 0 > self.vendorsPerPage {
                DispatchQueue.main.async {
                    self.isNextPageAvailable = true
                    self.vendors = vendors ?? []
                }
                return
            }
        DispatchQueue.main.async {
            self.isNextPageAvailable = false
            self.vendors = vendors ?? []
        }
    }
    
    func nextPage() {
        searchVendors(page: currentPage + 1)
    }
    
    func searchVendors(page: Int = 0) {
        currentPage = page
        Task {
            await fetchData(with: text.isEmpty ? nil : text)
        }
    }
}
