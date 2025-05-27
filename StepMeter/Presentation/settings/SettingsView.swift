//
//  SettingsView.swift
//  StepMeter
//
//  Created by Paweł Czapran on 27/05/2025.
//

import SwiftUI

struct SettingsView: View {

    let navigateBack: () -> Void
    @State private var showGoalDialog = false
    @State private var goalValue: String = "10000"
    
    var body: some View {
        VStack {
            SettingsHeaderView(navigateBack: navigateBack)
            Spacer()
            SettingsGoalView(goalValue: goalValue) {
                showGoalDialog = true
            }
            Spacer()
        }
        .sheet(isPresented: $showGoalDialog) {
            VStack(spacing: 20) {
                Text("Edit Goal")
                    .font(.headline)
                TextField("Goal", text: $goalValue)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                Button("Done") {
                    showGoalDialog = false
                }
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView(navigateBack: {})
}
