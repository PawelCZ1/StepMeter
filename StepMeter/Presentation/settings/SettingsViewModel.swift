//
//  SettingsViewModel.swift
//  StepMeter
//
//  Created by Paweł Czapran on 28/05/2025.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    @AppStorage("goalValue") var goalValue: Int = 10000
    @Published var editingGoal: String = ""

    func saveGoal() {
            if let newGoal = Int(editingGoal) {
                goalValue = newGoal
            }
        }
}
