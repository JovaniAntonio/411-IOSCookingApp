//
//  CategoryView.swift
//  411 Cooking app
//
//  Created by Jovani Antonio on 4/28/25.
//

import SwiftUI

// View to display a list of recipes for a specific category
struct CategoryView: View {
    // Access the shared view model containing all recipes
    @EnvironmentObject var recipesVM: RecipesViewModel
    
    // The category to filter recipes by (passed in)
    var category: Categories
    
    // Computed property that filters the recipe list by the selected category
    var recipes: [Recipe] {
        return recipesVM.recipes.filter { $0.category == category.rawValue }
    }
    
    var body: some View {
        ScrollView {
            // Reuse a RecipeList view to show filtered recipes
            RecipeList(recipes: recipes)
        }
        // Set the navigation title to the category name (pluralized)
        .navigationTitle(category.rawValue + "s")
    }
}

// Preview for SwiftUI canvas
#Preview {
    // Show preview with the "Dinner" category and a sample view model
    CategoryView(category: Categories.dinner)
        .environmentObject(RecipesViewModel())
}
