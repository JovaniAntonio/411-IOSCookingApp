//
//  RecipeSaverApp.swift
//  411 Cooking app
//
//  Created by Jovani Antonio on 4/29/25.
//

import SwiftUI

@main // Indicates this is the main entry point of the SwiftUI app
struct RecipeSaverApp: App {
    // Creates a single shared instance of the view model that can be used across views
    @StateObject var recipesViewModel = RecipesViewModel()
    
    var body: some Scene {
        WindowGroup {
            // The root view of the app, which is injected with the shared RecipesViewModel
            ContentView()
                .environmentObject(recipesViewModel) // Makes the view model accessible to all child views
        }
    }
}
