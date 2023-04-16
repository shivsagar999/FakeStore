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
    case serializationFailed
}

//extension NetworkError: LocalizedError {
//
//    public var errorDescription: String?  {
//
//        switch self {
//
//        case .bodyInGet:
//            <#code#>
//        case .invalidURL:
//            <#code#>
//        case .noInternet:
//            <#code#>
//        case .invalidResponse(_, _):
//            <#code#>
//        case .accessForbidden:
//            <#code#>
//        case .unknown:
//            <#code#>
//        case .httpError(_):
//            <#code#>
//        case .serializationFailed:
//            <#code#>
//        }
//
//    }
//
//}

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

class NetworkManager {
    
    
    func login(url: URL, method: HTTPMethod, headers: [String : String] = [:], body: [String: Any]? = nil) async throws -> Token {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        
        if let data = body {
            var serializedData: Data?
            do {
                serializedData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
            } catch {
                throw NetworkError.serializationFailed
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
            let token = try decoder.decode(Token.self, from: data)
            return token
        } catch {
            throw  error
        }
    }
    
    
    func fetchAllProducts(url: URL, method: HTTPMethod, headers: [String : String] = [:], token: String? = nil, data: [String: Any]? = nil) async throws -> [Product] {
        
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
