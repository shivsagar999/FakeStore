//
//  StoreViewModel.swift
//  FakeStore
//
//  Created by Shivsagar S Wagle on 14/04/23.
//

import Foundation

@MainActor
class StoreViewModel: ObservableObject {
    
    @Published var Data: Product?
    
    func LoadStoreData() {
        
    }
}
