//
//  Product.swift
//  FakeStore
//
//  Created by Shivsagar S Wagle on 14/04/23.
//

import Foundation

struct Product: Codable {
    let id: Int
    let title: String
    let price: Int
    let category: String
    let description: String
    let image: String
}
