//
//  CategoriesView.swift
//  411 Cooking app
//
//  Created by Jovani Antonio on 4/15/25.
//

import SwiftUI

// This view displays a list of all recipe categories.
struct CategoriesView: View {
    var body: some View {
        // NavigationView wraps the content to provide navigation between views
        NavigationView {
            List {
                // For each category in the Categories enum, create a NavigationLink
                ForEach(Categories.allCases) { category in
                    NavigationLink {
                        // When a category is tapped, navigate to CategoryView with the selected category
                        CategoryView(category: category)
                    } label: {
                        Text(category.rawValue + "s")
                    }
                }
            }
            // Title for the navigation bar
            .navigationTitle("Categories")
        }
        .navigationViewStyle(.stack)  // This ensures the navigation view uses a stack-style navigation on all devices
    }
}

#Preview {
    CategoriesView()
}
