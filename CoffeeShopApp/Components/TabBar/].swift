//
//  NavigationBar.swift
//  CoffeeShopApp
//
//  Created by Luciano Gomes on 07/08/24.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        NavigationStack {
            VStack {
                
            }
        }
        .toolbar {
            HomeToolBar()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Home")
        .padding()
    }
}

#Preview {
    NavigationBar()
}
