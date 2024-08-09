//
//  HomeView.swift
//  CoffeeShopApp
//
//  Created by Luciano Gomes on 08/08/24.
//

import SwiftUI

enum CategoriesIcons: String, CaseIterable {
    case coffee = "mug.fill"
    case desserts = "birthday.cake.fill"
    case alcohol = "wineglass.fill"
    case breakfast = "fork.knife.circle.fill"
}

struct HomeView: View {
    @State var coffeeShopSearch: String = ""
    @State private var selectedCategory: CategoriesIcons?
    
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
            
            TextField("Busque o que você procura...", text: $coffeeShopSearch)
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
            
            ScrollView(.vertical, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(CategoriesIcons.allCases, id: \.rawValue) { category in
                        Button(action: {
                            selectedCategory = category
                        }) {
                            VStack {
                                Image(systemName: category.rawValue)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(selectedCategory == category ? .white : .brown)
                            }
                            .frame(width: 70, height: 70)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(selectedCategory == category ? Color.brown : Color.white)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.brown, lineWidth: 2)
                            )
                            .padding(1)
                        }
                    }
                }.padding()
            }
            
            Spacer()
        }
    }
}

#Preview {
    HomeView(coffeeShopSearch: "")
}
