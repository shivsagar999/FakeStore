//
//  StoreViewModel.swift
//  FakeStore
//
//  Created by Shivsagar S Wagle on 14/04/23.
//

import Foundation

@MainActor
class StoreViewModel: ObservableObject {
    
    @Published var Data: [Product]?
    let networkManager = NetworkManager()
    
    func LoadStoreData() async {
        do {
            Data = try await networkManager.fetchAllProducts(url: URL(string: "https://fakestoreapi.com/products")! , method: .get)
        } catch {
            print(error)
        }
        
    }
}
