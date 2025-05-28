//
//  MainView.swift
//  StepMeter
//
//  Created by Paweł Czapran on 27/05/2025.
//

import SwiftUI

struct MainView: View {
    @StateObject private var stepViewModel = StepMeterViewModel()
    let navigateToSettings: () -> Void
    
        var body: some View {
            VStack {
                MainHeaderView(
                    selectedDate: $stepViewModel.selectedDate,
                    onDateSelected: { date in
                        stepViewModel.selectedDate = date
                        stepViewModel.fetchSteps(for: date)
                    },
                    navigateToSettings: navigateToSettings
                )
                Spacer()
                MainStepCounterView(steps: stepViewModel.steps)
                Spacer()
                MainFooterView(steps: stepViewModel.steps, goalValue: stepViewModel.goalValue)
            }
        }
}

#Preview {
    MainView(navigateToSettings: {})
}
