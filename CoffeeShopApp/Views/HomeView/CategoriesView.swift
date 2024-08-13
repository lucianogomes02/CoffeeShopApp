//
//  CategoriesView.swift
//  CoffeeShopApp
//
//  Created by Luciano Gomes on 13/08/24.
//

import SwiftUI

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


struct CategoriesView: View {
    @State private var selectedCategory: Categories?

    var categoriesItems: [GridItem] {
        let deviceWidth = UIScreen.main.bounds.width
        var rowsInGrid = 1

        if (deviceWidth.truncatingRemainder(dividingBy: 2) == 0) {
            rowsInGrid = 1
        } else {
            rowsInGrid = 2
        }
        return Array(repeating: GridItem(.flexible(minimum: 100)), count: rowsInGrid)
    }
    
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
            }
        }
    
    var body: some View {
        LazyHGrid(rows: categoriesItems, spacing: 20) {
            ForEach(Categories.allCases, id: \.self) { category in
                    categoryButton(category: category)
                }
        }
        .padding([.horizontal, .top], 15)
        .padding(.leading)
    }
}

#Preview {
    CategoriesView()
}
