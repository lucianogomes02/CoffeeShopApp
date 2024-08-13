//
//  ProductsHomeListView.swift
//  CoffeeShopApp
//
//  Created by Luciano Gomes on 13/08/24.
//

import SwiftUI

struct ProductsHomeListView: View {
    var coffeeShopSearch: String
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 300))]) {
                ForEach(productsMock.filter {
                    coffeeShopSearch.isEmpty || $0.name.contains(coffeeShopSearch)
                }) { product in
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
}

#Preview {
    ProductsHomeListView(coffeeShopSearch: "")
}
