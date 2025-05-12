//
//  Add New Recipes view.swift
//  411 Cooking app
//
//  Created by Jovani Antonio on 4/15/25.
//

import SwiftUI

// This view allows users to navigate to a screen to manually add a new recipe.
struct Add_New_Recipes_view: View {
    // A boolean state variable that determines whether the sheet to add a recipe is shown
    @State private var showAddRecipe = false
    
    var body: some View {
        NavigationView {
            // Button that sets showAddRecipe to true when tapped
            Button("Add recipe Manually") {
                showAddRecipe = true
            }
            // Title displayed in the navigation bar
            .navigationTitle("Add New Recipe")
        }
        // Ensures consistent navigation style across devices
        .navigationViewStyle(.stack)
        
        // Presents the AddRecipeView modally as a sheet when showAddRecipe is true
        .sheet(isPresented: $showAddRecipe) {
            AddRecipeView()
        }
    }
}


#Preview {
    Add_New_Recipes_view()
}
