//
//  StepMeterViewModel.swift
//  StepMeter
//
//  Created by Paweł Czapran on 27/05/2025.
//

import CoreMotion
import SwiftUI

class StepMeterViewModel: ObservableObject {
    @Published var steps: Int = 0
    @Published var goalValue: Int
    @Published var selectedDate: Date = Date()
    private let pedometer = CMPedometer()

    init() {
        let savedGoal = UserDefaults.standard.integer(forKey: "goalValue")
        self.goalValue = savedGoal == 0 ? 10000 : savedGoal
        self.selectedDate = Calendar.current.startOfDay(for: Date())
        startTracking()
    }
    
    func fetchSteps(for date: Date) {
            // Fetch steps for the given date and update self.steps
            // Example: self.steps = ... (fetch from HealthKit or your data source)
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: date)
        guard let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay) else { return }
        pedometer.queryPedometerData(from: startOfDay, to: endOfDay) { [weak self] data, error in
            DispatchQueue.main.async {
                if let steps = data?.numberOfSteps.intValue, error == nil {
                    self?.steps = steps
                } else {
                    self?.steps = 0
                }
            }
        }
    }

    func startTracking() {
        guard CMPedometer.isStepCountingAvailable() else { return }
        pedometer.startUpdates(from: Calendar.current.startOfDay(for: Date())) { [weak self] data, error in
            DispatchQueue.main.async {
                self?.steps = data?.numberOfSteps.intValue ?? 0
            }
        }
    }

    deinit {
        pedometer.stopUpdates()
    }
}
