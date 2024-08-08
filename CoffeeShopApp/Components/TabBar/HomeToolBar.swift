//
//  HomeToolBar.swift
//  CoffeeShopApp
//
//  Created by Luciano Gomes on 07/08/24.
//

import SwiftUI

struct HomeToolBar: ToolbarContent {
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Text("Home")
        }
        
        ToolbarItem(placement: .principal) {
            Image(systemName: "bus")
        }
        
        ToolbarItem(placement: .bottomBar){
            Text("AAAAAA")
        }
    }
}
