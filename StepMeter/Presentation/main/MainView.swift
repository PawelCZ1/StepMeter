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
            ZStack {
                LinearGradient(
                    colors: [Color.blue.opacity(0.3), Color.green.opacity(0.3)],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                        .ignoresSafeArea()
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
                    MainStepCounterView(steps: stepViewModel.steps, selectedDate: $stepViewModel.selectedDate)
                    Spacer()
                    MainFooterView(steps: stepViewModel.steps, goalValue: stepViewModel.goalValue)
                }
            }
            
        }
}

#Preview {
    MainView(navigateToSettings: {})
}
