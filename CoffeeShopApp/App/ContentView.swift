//
//  ContentView.swift
//  CoffeeShopApp
//
//  Created by Luciano Gomes on 07/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .house
    
    var body: some View {
        TabBar(selectedTab: $selectedTab)
    }
}

#Preview {
    ContentView()
}
