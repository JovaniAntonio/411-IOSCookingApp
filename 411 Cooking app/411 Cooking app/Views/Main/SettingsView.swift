//
//  SettingsView.swift
//  411 Cooking app
//
//  Created by Jovani Antonio on 4/15/25.
//

import SwiftUI

// A placeholder view for the Settings screen
struct SettingsView: View {
    var body: some View {
        // Embeds the content in a navigation view to enable a navigation bar
        NavigationView {
            // Simple text indicating the settings screen
            Text("Settings")
                .navigationTitle("Settings") // Sets the title in the navigation bar
        }
        .navigationViewStyle(.stack) // Ensures consistent navigation style across devices (especially on iPad)
    }
}

// Preview for SwiftUI canvas
#Preview {
    SettingsView()
}
