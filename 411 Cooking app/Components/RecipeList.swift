//
//  RecipeList.swift
//  411 Cooking app
//
//  Created by Jovani Antonio on 4/28/25.
//

import SwiftUI

// A view that displays a list of recipe cards in a grid layout
struct RecipeList: View {
    var recipes: [Recipe]  // The list of recipes to display
    
    var body: some View {
        VStack {
            // Header showing the number of recipes
            HStack {
                Text("\(recipes.count) \(recipes.count > 1 ? "recipes" : "recipe")")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.7)
                
                Spacer() // Pushes the text to the leading edge
            }
            
            // Responsive grid layout for recipe cards
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], // Adapts based on screen width
                spacing: 15 // Vertical spacing between rows
            ) {
                // Loop through all recipes
                ForEach(recipes) { recipe in
                    // Each recipe card is wrapped in a NavigationLink to its detail view
                    NavigationLink(destination: RecipesView(recipe: recipe)) {
                        RecipeCard(recipe: recipe)
                    }
                }
            }
            .padding(.top) // Adds spacing above the grid
        }
        .padding(.horizontal) // Adds padding on the left and right sides
    }
}

// Preview for SwiftUI canvas
#Preview {
    ScrollView {
        RecipeList(recipes: Recipe.all)
    }
}
