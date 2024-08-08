//
//  TabBar.swift
//  CoffeeShopApp
//
//  Created by Luciano Gomes on 07/08/24.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case house
    case heart
    case cart
    case person
}

enum TabLabels: String {
    case house = "Inicio"
    case heart = "Favoritos"
    case cart = "Carrinho"
    case person = "Perfil"
}

struct TabBar: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        TabView {
            HomeView()
            .tabItem {
                Image(systemName: "house")
                Text("Inicio")
            }
            .tag(0)
            
            FavoritesView()
            .tabItem {
                Image(systemName: "heart")
                Text("Favorito")
            }
            .tag(1)
            
            CartView()
            .tabItem {
                Image(systemName: "cart")
                Text("Carrinho")
            }
            .tag(2)
            
            ProfileView()
            .tabItem {
                Image(systemName: "person")
                Text("Perfil")
            }
            .tag(3)
        }
    }
}

#Preview {
    TabBar(selectedTab: .constant(.house))
}
