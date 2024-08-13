//
//  HomeView.swift
//  CoffeeShopApp
//
//  Created by Luciano Gomes on 08/08/24.
//

import SwiftUI

struct HomeView: View {
    @State var coffeeShopSearch: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Image(systemName: "mappin.and.ellipse.circle")
                    .imageScale(.large)
                    .foregroundStyle(.brown)
                Text("Rua Teste, 123 - Vila Teste - São Paulo, Brasil")
                    .font(.headline)
                    .fontWidth(Font.Width.condensed)
            }
            .padding()
            
            HStack(alignment: .top) {
              Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundStyle(.brown)
              TextField("Busque o que você procura...", text: $coffeeShopSearch)
                .onSubmit {
                    print($coffeeShopSearch) // TODO alterar
                }
            }
            .padding()
            .overlay(
              RoundedRectangle(cornerRadius: 50)
                .stroke(Color.brown, lineWidth: 1.5)
            )
            .padding()
        
            Text("Categorias")
                .font(.title)
                .padding(.leading)

            CategoriesView()
            
            Text("Produtos")
                .font(.title)
                .padding([.leading, .top])
            
            ProductsHomeListView()
        }
    }
}

#Preview {
    HomeView(coffeeShopSearch: "")
}
