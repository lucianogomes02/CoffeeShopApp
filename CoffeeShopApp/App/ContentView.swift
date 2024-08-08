//
//  ContentView.swift
//  CoffeeShopApp
//
//  Created by Luciano Gomes on 07/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .house
    @State private var coffeeShopSearch: String = ""
    
    var body: some View {
        TabBar(selectedTab: $selectedTab)
    }
}

#Preview {
    ContentView()
}
