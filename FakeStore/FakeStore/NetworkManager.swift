//
//  NetworkManager.swift
//  FakeStore
//
//  Created by Shivsagar S Wagle on 14/04/23.
//

import Foundation
import Combine

public enum NetworkError: Error, Equatable {
    case bodyInGet
    case invalidURL
    case noInternet
    case invalidResponse(Data?, URLResponse?)
    case accessForbidden
    case unknown
    case httpError(Int)
}

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

class NetworkManager<T> {
    
    public var session: T
    
    init(session: T) {
        self.session = session
    }
    
    
    func fetch(url: URL, method: HTTPMethod, headers: [String : String] = [:], token: String? = nil, data: [String: Any]? = nil) async throws -> [Product] {
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30.0)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        
        if let bearerToken = token {
                    request.setValue("Bearer \(bearerToken)", forHTTPHeaderField: "Authorization")
                }
                if let data = data {
                    var serializedData: Data?
                    do {
                        serializedData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
                    } catch {
                        throw error
                    }
                    request.httpBody = serializedData
                }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        //Check if response is valid
        if let response = response as? HTTPURLResponse,
           response.statusCode != 200 {
            throw NetworkError.invalidResponse(data, response)
        }
       
        let decoder = JSONDecoder()
        
        do {
            let products = try decoder.decode([Product].self, from: data)
            return products
        } catch {
            throw  error
        }
        
        
    }
}
