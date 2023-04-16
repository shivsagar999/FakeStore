//
//  LoginViewModel.swift
//  FakeStore
//
//  Created by Shivsagar S Wagle on 15/04/23.
//

import Foundation

@MainActor
class LoginViewModel: ObservableObject {
    
    @Published var isAuthenticated: Bool = false
    
    func login(email: String, password: String) async throws {
        let defaults = UserDefaults.standard
        
        do {
            let token = try await NetworkManager().login(url: URL(string: "https://fakestoreapi.com/auth/login")!, method: .post, body: ["username": email, "password": password])
            defaults.setValue(token.token, forKey: "jsonwebtoken")
            isAuthenticated = true
        } catch {
            throw error
        }
    }
    
}
