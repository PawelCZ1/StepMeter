//
//  SettingsViewModel.swift
//  StepMeter
//
//  Created by Paweł Czapran on 28/05/2025.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var goalValue: Int
    @Published var editingGoal: String = ""

    init() {
        let savedGoal = UserDefaults.standard.integer(forKey: "goalValue")
        self.goalValue = savedGoal == 0 ? 10000 : savedGoal
    }

    func saveGoal() {
        if let newGoal = Int(editingGoal) {
            goalValue = newGoal
            UserDefaults.standard.set(newGoal, forKey: "goalValue")
        }
    }
}
