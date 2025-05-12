//
//  RecipesViewModel.swift
//  411 Cooking app
//
//  Created by Jovani Antonio on 4/29/25.
//

import Foundation

class RecipesViewModel: ObservableObject {
    // Make an empty array
    @Published private(set) var recipes: [Recipe] = []
    
    init() {
        recipes = Recipe.all
    }
    func addRecipe(recipe: Recipe) {
        recipes.append(recipe)
    }
}
