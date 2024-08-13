//
//  HomeView.swift
//  CoffeeShopApp
//
//  Created by Luciano Gomes on 08/08/24.
//

import SwiftUI

struct HomeView: View {
    @State var coffeeShopSearch: String = ""
    
    @ViewBuilder
    private func productsList() -> some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 300))]) {
                ForEach(productsMock) { product in
                    HStack {
                        Image(product.image)
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 180, height: 100, alignment: .leading)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .padding()
                        
                        VStack {
                            Text(product.name)
                                .frame(alignment: .bottomLeading)
                            
                            Text("R$\(String(format: "%.2f", product.price))")
                                .frame(alignment: .bottomLeading)
                            
                            HStack {
                                Button(action: {}) {
                                    Image(systemName: "plus.circle")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(.white)
                                        .background(Color.brown)
                                        .cornerRadius(20)
                                }
                                
                                Button(action: {}) {
                                    Image(systemName: "heart")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.brown)
                                        .background(Color.white)
                                }
                            }
                        }.padding()
                    }
                    .frame(width: 350, height: 150)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 24.0))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.brown, lineWidth: 2)
                    )
                    .padding(.top)
                }
            }
        }
        .background(Color.white)
        .frame(alignment: .leading)
        .padding([.top, .bottom], 10)
    }
    
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
            
            productsList()
        }
    }
}

#Preview {
    HomeView(coffeeShopSearch: "")
}
