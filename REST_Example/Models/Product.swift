//
//  Product.swift
//  REST_Example
//
//  Created by E5000855 on 11/06/24.
//

import Foundation

struct Product: Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
}

struct Rating: Codable {
    let rate: Double
    let count: Int
}


struct NewProduct: Codable {
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
}


struct ProductP: Codable {
    let title: String
    let price: Double
    let description: String
    let image: String
    let category: String
}
