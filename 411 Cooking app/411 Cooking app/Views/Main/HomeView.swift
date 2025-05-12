//
//  HomeView.swift
//  411 Cooking app
//
//  Created by Jovani Antonio on 4/15/25.
//

import SwiftUI

// The main screen displaying a list of all recipes
struct HomeView: View {
    // Access the shared RecipesViewModel from the environment
    @EnvironmentObject var recipesVM: RecipesViewModel

    var body: some View {
        // NavigationView provides a navigation bar and enables navigation between views
        NavigationView {
            // ScrollView allows vertical scrolling for long recipe lists
            ScrollView {
                // Display a list of all recipes using the custom RecipeList view
                RecipeList(recipes: recipesVM.recipes)
            }
            .navigationTitle("My Recipes") // Title shown in the navigation bar
        }
        .navigationViewStyle(.stack) // Ensures stack style navigation (important for iPad compatibility)
    }
}


#Preview {
    HomeView()
        .environmentObject(RecipesViewModel()) 
}
