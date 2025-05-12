//
//  AddRecipeView.swift
//  411 Cooking app
//
//  Created by Jovani Antonio on 4/28/25.
//

import SwiftUI

// View for adding a new recipe
struct AddRecipeView: View {
    // Access the shared view model containing recipe data
    @EnvironmentObject var recipesVM: RecipesViewModel

    // State variables to hold form input
    @State private var name: String = ""
    @State private var selectedCategory: Categories = Categories.main
    @State private var description: String = ""
    @State private var ingredients: String = ""
    @State private var directions: String = ""
    @State private var navigatetoRecipe: Bool = false
    
    // Used to dismiss the current view
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                // Input for recipe name
                Section(header: Text("Name")){
                    TextField("Recipe Name", text: $name)
                }
                
                // Dropdown menu for selecting a category
                Section(header: Text("Category")) {
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(Categories.allCases) { category in
                            Text(category.rawValue)
                                .tag(category)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                // Text area for recipe description
                Section(header: Text("Description")) {
                    TextEditor(text: $description)
                }
                
                // Text area for listing ingredients
                Section(header: Text("Ingredients")) {
                    TextEditor(text: $ingredients)
                }
                
                // Text area for cooking directions
                Section(header: Text("Directions")){
                    TextEditor(text: $directions)
                }
            }
            .toolbar {
                // Cancel button to dismiss the view
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Label("Cancel", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    }
                }
                
                // Done button to save the recipe and navigate to the latest one
                ToolbarItem {
                    NavigationLink(isActive: $navigatetoRecipe) {
                        RecipesView(recipe: recipesVM.recipes.sorted { $0.datePublished > $1.datePublished }[0])
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Button {
                            saveRecipe()
                            navigatetoRecipe = true
                        } label: {
                            Label("Done", systemImage: "checkmark")
                                .labelStyle(.iconOnly)
                        }
                    }
                    // Disable Done button if name is empty
                    .disabled(name.isEmpty)
                }
            }
            .navigationTitle("New Recipe")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
}

// Preview for SwiftUI canvas
#Preview {
    AddRecipeView()
}

// Extension to handle saving the new recipe
extension AddRecipeView {
    private func saveRecipe() {
        let now = Date()
        
        // Format the current date to a string
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let datePublished = dateFormatter.string(from: now)
        
        print(datePublished) // Debug print of date
        
        // Create new recipe instance
        let recipe = Recipe(
            name: name,
            image: "", // Placeholder for image
            descriptions: description,
            ingredients: ingredients,
            directions: directions,
            category: selectedCategory.rawValue,
            datePublished: "", // Can update this with `datePublished` if needed
            url: ""
        )
        
        // Add the recipe to the shared view model
        recipesVM.addRecipe(recipe: recipe)
    }
}
