//
//  ProductsMock.swift
//  CoffeeShopApp
//
//  Created by Luciano Gomes on 09/08/24.
//

import Foundation

let productsMock: [Product] = [
    Product(id: UUID(), name: "Cappuccino", image: "cappuccino", description: "Café Cappucino", category: Categories.coffee, price: 15.00),
    Product(id: UUID(), name: "Expresso", image: "expresso", description: "Café Expresso", category: Categories.coffee, price: 8.00),
    Product(id: UUID(), name: "Americano", image: "americano", description: "Café Americano", category: Categories.coffee, price: 10.00),
    Product(id: UUID(), name: "Latte", image: "latte", description: "Café Latte", category: Categories.coffee, price: 13.00),
    Product(id: UUID(), name: "Caipirinha", image: "caipirinha", description: "Caipirinha delicia do benzinho", category: Categories.alcohol, price: 25.00),
]
