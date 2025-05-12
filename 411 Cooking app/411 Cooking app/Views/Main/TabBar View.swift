//
//  TabBar View.swift
//  411 Cooking app
//
//  Created by Jovani Antonio on 4/15/25.
//

import SwiftUI

// Main TabBar view that allows navigation between different sections of the app
struct TabBar_View: View {
    var body: some View {
        TabView {
            // Home tab showing the main landing page
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house") // Tab label and icon
                }

            // Categories tab showing recipe categories
            CategoriesView()
                .tabItem {
                    Label("Categories", systemImage: "square.fill.text.grid.1x2")
                }
            
            // Add tab for adding new recipes
            Add_New_Recipes_view()
                .tabItem {
                    Label("Add", systemImage: "plus")
                }
            
            // Settings tab for app configuration
            SettingsView()
                .tabItem {
                    Label("Setting", systemImage: "gear")
                }
        }
    }
}

#Preview {
    TabBar_View()
        .environmentObject(RecipesViewModel()) 
}
