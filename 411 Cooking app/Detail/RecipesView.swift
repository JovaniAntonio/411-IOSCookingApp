//
//  RecipesView.swift
//  411 Cooking app
//
//  Created by Jovani Antonio on 4/28/25.
//

import SwiftUI

// View to display the details of a single recipe
struct RecipesView: View {
    var recipe: Recipe  // The recipe to display
    
    var body: some View {
        ScrollView {
            // Load and display the recipe image from a URL
            AsyncImage(url: URL(string: recipe.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill) // Fill the image area while maintaining aspect ratio
            } placeholder: {
                // Placeholder shown while image loads
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(height: 250) // Set height for image area
            .background(
                // Gray gradient background behind the image
                LinearGradient(
                    gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            
            // Recipe content
            VStack(spacing: 50) {
                // Recipe name
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                
                // Description, Ingredients, and Directions sections
                VStack(alignment: .leading, spacing: 30) {
                    
                    // Show description if it's not empty
                    if !recipe.descriptions.isEmpty {
                        Text(recipe.descriptions)
                    }
                    
                    // Show ingredients if not empty
                    if !recipe.ingredients.isEmpty {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Ingredients")
                                .font(.headline)
                            
                            Text(recipe.ingredients)
                        }
                    }
                    
                    // Show directions if not empty
                    if !recipe.directions.isEmpty {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Directions")
                                .font(.headline)
                            
                            Text(recipe.directions)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal)
            
            // Button to navigate to CookingStepsListView
            NavigationLink(destination: CookingStepsListView()) {
                Text("Start Cooking")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 5) // Controls button size
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(7)
                    .padding(.bottom)
            }
        }
        .ignoresSafeArea(.container, edges: .top) // Allows image to extend under the status bar
    }
}

// Preview for the view using a sample recipe
#Preview {
    RecipesView(recipe: Recipe.all[0])
}
