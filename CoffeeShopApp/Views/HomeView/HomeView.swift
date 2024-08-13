//
//  HomeView.swift
//  CoffeeShopApp
//
//  Created by Luciano Gomes on 08/08/24.
//

import SwiftUI

struct HomeView: View {
    @State var coffeeShopSearch: String = ""
    @FocusState private var isSearching: Bool
    
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
                ZStack(alignment: .trailing) {
                    TextField("Busque o que você procura...", text: $coffeeShopSearch)
                      .focused($isSearching)
                      .frame(width: 250, height: 30)
                      .padding(.trailing, 50)

                    if isSearching || !coffeeShopSearch.isEmpty {
                          Button(action: {
                              self.coffeeShopSearch = ""
                              self.isSearching = false
                          }) {
                              Image(systemName: "xmark.circle.fill")
                                  .foregroundColor(.brown)
                                  .padding(.horizontal, 10)
                                  .background(Color.white)
                                  .imageScale(.large)
                          }
                      }
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
            
            ProductsHomeListView(coffeeShopSearch: coffeeShopSearch)
        }
    }
}

#Preview {
    HomeView(coffeeShopSearch: "")
}
