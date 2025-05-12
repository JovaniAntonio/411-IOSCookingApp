//
//  FinishView.swift
//  411 Cooking app
//
//  Created by Jovani Antonio on 5/1/25.
//

import SwiftUI

// A view that appears after the user finishes cooking a recipe
struct FinishView: View {
    var body: some View {
        VStack(spacing: 40) {
            Spacer() // Pushes content down to center vertically

            // A checkmark icon to indicate success/completion
            Image(systemName: "checkmark.seal.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .foregroundColor(.green)

            // Title text
            Text("You're Done!")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)

            // Congratulatory message
            Text("Congratulations on completing the recipe! Enjoy your meal.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Spacer() // Pushes content upward from the bottom
                .padding(.horizontal) // Padding applies here due to chaining, although this may not have any visible effect
        }
        .padding() // Padding around the whole VStack
        .navigationTitle("Finished") // Title for the navigation bar
        .navigationBarBackButtonHidden(true) // Hides the back button to prevent going back after finishing
    }
}


#Preview {
    FinishView()
}
