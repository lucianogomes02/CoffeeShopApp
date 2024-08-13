//
//  CoffeeShopAppApp.swift
//  CoffeeShopApp
//
//  Created by Luciano Gomes on 07/08/24.
//

import SwiftUI

@main
struct CoffeeShopApp: App {
    @StateObject var categoryFilter = SelectedCategoryFilter()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(categoryFilter)
        }
    }
}
