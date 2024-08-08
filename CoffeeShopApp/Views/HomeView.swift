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
            }.frame(width: .infinity).padding()
            
            TextField("Buscar cafeterias...", text: $coffeeShopSearch)
                .onSubmit {
                    print($coffeeShopSearch) // TODO alterar
                }
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 20).fill(.windowBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 1)
                )
                .foregroundColor(.brown)
                .frame(width: .infinity, height: 40)
                .padding()
            
            HStack {
                Text("Categorias")
                    .font(.title)
                    .padding(.leading)
            }
            
            Spacer().frame(width: nil, height: 550)
        }
    }
}

#Preview {
    HomeView(coffeeShopSearch: "")
}
