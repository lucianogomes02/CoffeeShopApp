//
//  TabBar.swift
//  CoffeeShopApp
//
//  Created by Luciano Gomes on 07/08/24.
//

import SwiftUI

struct TabBar: View {
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
            
            OrdersView()
            .tabItem {
                Image(systemName: "newspaper")
                Text("Pedidos")
            }
            .tag(3)
            
            ProfileView()
            .tabItem {
                Image(systemName: "person")
                Text("Perfil")
            }
            .tag(4)
        }.tint(.brown)
    }
}

#Preview {
    TabBar()
}
