//
//  Product.swift
//  CoffeeShopApp
//
//  Created by Luciano Gomes on 09/08/24.
//

import Foundation

enum CoffeeSize {
    case small
    case medium
    case large
}

struct Product: Identifiable {
    let id: UUID
    let name: String
    let image: String
    let description: String
    let price: Double
}
