//
//  ContentView.swift
//  411 Cooking app
//
//  Created by Jovani Antonio on 4/15/25.
//

import SwiftUI

// MARK: - ContentView

// Main entry view of the app
struct ContentView: View {
    var body: some View {
        // The TabBar_View is the main navigation hub of the app.

        TabBar_View()
    }
}

// Preview for SwiftUI canvas
#Preview {
    ContentView()
        .environmentObject(RecipesViewModel())
}
