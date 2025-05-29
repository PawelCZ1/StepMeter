//
//  StatisticsViewModel.swift
//  StepMeter
//
//  Created by Paweł Czapran on 29/05/2025.
//

import Foundation
import SwiftUI
import CoreMotion

class StatisticsViewModel: ObservableObject {
    @Published var stepCounts: [Int] = Array(repeating: 0, count: 7)
    private let pedometer = CMPedometer()

    var maxSteps: Int {
        stepCounts.max() ?? 1
    }
    
    var avgSteps: Int {
        let sum = stepCounts.reduce(0, +)
        return sum / stepCounts.count
    }
    
    init() {
        fetchStepCountsForLast7Days()
    }

    func fetchStepCountsForLast7Days() {
        guard CMPedometer.isStepCountingAvailable() else { return }
        let calendar = Calendar.current
        let now = Date()
        var counts: [Int] = Array(repeating: 0, count: 7)
        let group = DispatchGroup()

        for i in 0..<7 {
            group.enter()
            if let startOfDay = calendar.date(byAdding: .day, value: -(6 - i), to: calendar.startOfDay(for: now)),
                let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay) {
                pedometer.queryPedometerData(from: startOfDay, to: endOfDay) { data, error in
                    if let steps = data?.numberOfSteps.intValue {
                        counts[i] = steps
                    }
                        group.leave()
                    }
            } else {
                group.leave()
            }
        }

        group.notify(queue: .main) {
            self.stepCounts = counts
        }
    }

    func shortDayName(for index: Int) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        let today = Calendar.current.component(.weekday, from: Date())
        let dayIndex = (today - 7 + index + 7) % 7
        return formatter.shortWeekdaySymbols[dayIndex]
    }
}
