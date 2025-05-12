//
//  CookingView.swift
//  411 Cooking app
//
//  Created by Jovani Antonio on 5/1/25.
//

import SwiftUI

// MARK: - CookingStep Model

// Model representing a single step in the cooking process
struct CookingStep: Identifiable {
    let id = UUID()                    // Unique identifier for each step
    let name: String                  // Name/description of the step
    let imageName: String             // Name of the image associated with the step
    let duration: TimeInterval        // Duration for the timer in seconds
}

// MARK: - CookingStepView

// View representing a single cooking step with a timer
struct CookingStepView: View {
    let step: CookingStep                          // The step to display
    @State private var timeRemaining: TimeInterval // Remaining time for the timer
    @State private var timer: Timer? = nil         // Optional timer instance
    @State private var isRunning: Bool = false     // Tracks whether the timer is running
    @State private var isCompleted: Bool = false   // Tracks whether the step is completed

    var onComplete: () -> Void                     // Callback for when the step is completed

    // Custom initializer to set initial timer value from the step's duration
    init(step: CookingStep, onComplete: @escaping () -> Void) {
        self.step = step
        self.onComplete = onComplete
        _timeRemaining = State(initialValue: step.duration)
    }

    // Calculates the progress of the timer as a value between 0.0 and 1.0
    var progress: Double {
        1.0 - (timeRemaining / step.duration)
    }

    var body: some View {
        HStack {
            // Step image
            Image(step.imageName)
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())

            VStack(alignment: .leading) {
                Text(step.name) // Step name
                
                // Progress bar showing time progress
                ProgressView(value: progress)
                    .progressViewStyle(LinearProgressViewStyle())

                // Countdown timer display
                Text("\(Int(timeRemaining))s")
                    .monospacedDigit()
            }

            Spacer()

            // Start button
            Button(action: {
                startTimer()
            }) {
                Text(isRunning ? "Running" : "Start")
                    .font(.caption)
                    .padding(6)
                    .background(isRunning ? Color.gray : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(isRunning || isCompleted) // Disable button if already running or done
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .onDisappear {
            // Clean up timer when view disappears
            timer?.invalidate()
        }
    }

    // Starts the timer for the step
    private func startTimer() {
        guard !isRunning else { return } // Prevent multiple timers

        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                // When time runs out
                timer?.invalidate()
                isRunning = false
                isCompleted = true
                onComplete() // Notify parent view
            }
        }
    }
}

// MARK: - CookingStepsListView

// View containing the list of all cooking steps
struct CookingStepsListView: View {
    @State private var completedSteps: Int = 0           // Counter for completed steps
    @State private var navigateToNextView: Bool = false  // Flag to trigger navigation

    // List of cooking steps with dummy data
    let steps = [
        CookingStep(name: "Boil", imageName: "Add", duration: 8),
        CookingStep(name: "Add Pasta", imageName: "Flavor", duration: 6),
        CookingStep(name: "Strain Pasta", imageName: "Strain", duration: 5)
    ]

    // Computed property to determine if all steps are done
    var allCompleted: Bool {
        completedSteps == steps.count
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                // List of steps in a scrollable view
                ScrollView {
                    ForEach(steps) { step in
                        CookingStepView(step: step) {
                            completedSteps += 1 // Increment on step completion
                        }
                    }
                }

                // Show "Complete" button only after all steps are done
                if allCompleted {
                    Button("Complete") {
                        navigateToNextView = true
                    }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }

                // NavigationLink to transition to the FinishView
                NavigationLink(destination: FinishView(), isActive: $navigateToNextView) {
                    EmptyView() // Hidden link that activates on state change
                }
            }
            .padding()
            .navigationTitle("Cooking Steps") // Page title
        }
    }
}

// Preview for SwiftUI canvas
#Preview {
    CookingStepsListView()
}
