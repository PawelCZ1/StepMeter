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
    private let pedometer = CMPedometer()

    init() {
        let savedGoal = UserDefaults.standard.integer(forKey: "goalValue")
        self.goalValue = savedGoal == 0 ? 10000 : savedGoal
        startTracking()
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
