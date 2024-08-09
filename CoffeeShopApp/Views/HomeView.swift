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
    
    private func categoryButton(category: Categories) -> some View {
            Button(action: {
                selectedCategory = category
            }) {
                VStack {
                    Image(systemName: selectCategoryIcon(category: category.rawValue))
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(selectedCategory == category ? .white : .brown)
                    Text(selectCategoryLabel(category: category.rawValue))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(selectedCategory == category ? .white : .brown)
                }
                .frame(width: 150, height: 100)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(selectedCategory == category ? Color.brown : Color.white)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.brown, lineWidth: 2)
                )
            }.padding(8)
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
            
            LazyHGrid(rows: [
                GridItem(.fixed(100)),
                GridItem(.fixed(100))
            ]) {
                ForEach(Categories.allCases, id: \.rawValue) { category in
                        categoryButton(category: category)
                    }
                }.padding()
            
            Spacer()
        }
    }
}

#Preview {
    HomeView(coffeeShopSearch: "")
}
