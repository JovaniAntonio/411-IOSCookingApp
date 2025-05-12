//
//  RecipeCard.swift
//  411 Cooking app
//
//  Created by Jovani Antonio on 4/28/25.
//

import SwiftUI

// A reusable card view for displaying a single recipe's preview
struct RecipeCard: View {
    var recipe: Recipe  // The recipe to display
    
    var body: some View {
        VStack {
            // Load and display the recipe image asynchronously
            AsyncImage(url: URL(string: recipe.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill) // Maintain aspect ratio and fill the space
                    .frame(height: 232) // Set image height
                    .overlay(alignment: .bottom) {
                        // Overlay the recipe name text at the bottom of the image
                        Text(recipe.name)
                            .font(.headline)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 3, x: 0, y: 0)
                            .frame(maxWidth: 136)
                            .padding()
                    }
            } placeholder: {
                // Placeholder shown while the image is loading
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(alignment: .bottom) {
                        // Show recipe name over placeholder too
                        Text(recipe.name)
                            .font(.headline)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 3, x: 0, y: 0)
                            .frame(maxWidth: 136)
                            .padding()
                    }
            }
        }
        // Set the overall card size and style
        .frame(width: 160, height: 217, alignment: .top)
        .background(
            // Add gradient background in case image doesn't load
            LinearGradient(
                gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous)) // Round the card corners
        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 10) // Add a subtle drop shadow
    }
}

// Preview for SwiftUI canvas
#Preview {
    RecipeCard(recipe: Recipe.all[0])
}
