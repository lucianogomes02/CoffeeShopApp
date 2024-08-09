//
//  HomeView.swift
//  CoffeeShopApp
//
//  Created by Luciano Gomes on 08/08/24.
//

import SwiftUI

enum Categories: String, CaseIterable {
    case coffee
    case desserts
    case alcohol
    case food
}

enum CategoriesLabels: String, CaseIterable {
    case coffeeLabel = "Café"
    case dessertsLabel = "Sobremesas"
    case alcoholLabel = "Alcoólicas"
    case foodLabel = "Lanches"
}

enum CategoriesIcons: String, CaseIterable {
    case coffeeIcon = "mug.fill"
    case dessertsIcon = "birthday.cake.fill"
    case alcoholIcon = "wineglass.fill"
    case foodIcon = "fork.knife.circle.fill"
}

struct HomeView: View {
    @State var coffeeShopSearch: String = ""
    @State private var selectedCategory: Categories?
    
    private func selectCategoryLabel(category: String) -> String {
        switch(category) {
            case "coffee":
                return CategoriesLabels.coffeeLabel.rawValue
            case "desserts":
                return CategoriesLabels.dessertsLabel.rawValue
            case "alcohol":
                return CategoriesLabels.alcoholLabel.rawValue
            case "food":
                return CategoriesLabels.foodLabel.rawValue
            default:
                return CategoriesLabels.coffeeLabel.rawValue
            }
    }
    
    private func selectCategoryIcon(category: String) -> String {
        switch(category) {
            case "coffee":
                return CategoriesIcons.coffeeIcon.rawValue
            case "desserts":
                return CategoriesIcons.dessertsIcon.rawValue
            case "alcohol":
                return CategoriesIcons.alcoholIcon.rawValue
            case "food":
                return CategoriesIcons.foodIcon.rawValue
            default:
                return CategoriesIcons.coffeeIcon.rawValue
            }
    }
    
    @ViewBuilder
    private func categoryButton(category: Categories) -> some View {
            Button(action: {
                selectedCategory = category
            }) {
                VStack {
                    Image(systemName: selectCategoryIcon(category: category.rawValue))
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(selectedCategory == category ? .white : .brown)
                    Text(selectCategoryLabel(category: category.rawValue))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(selectedCategory == category ? .white : .brown)
                }
                .frame(width: 150, height: 80)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(selectedCategory == category ? Color.brown : Color.white)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.brown, lineWidth: 2)
                )
            }.padding()
        }
    
    @ViewBuilder
    private func productsList() -> some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: [GridItem(.fixed(100))]) {
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
                            
                            Button(action: {}) {
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.white)
                                    .background(Color.brown)
                                    .cornerRadius(20)
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

            LazyHGrid(rows: [
                GridItem(.fixed(100)),
                GridItem(.fixed(100))
            ]) {
                ForEach(Categories.allCases, id: \.rawValue) { category in
                        categoryButton(category: category)
                    }
                }.padding()
            
            Text("Produtos")
                .font(.title)
                .padding(.leading)
            
            productsList()
        }
    }
}

#Preview {
    HomeView(coffeeShopSearch: "")
}
