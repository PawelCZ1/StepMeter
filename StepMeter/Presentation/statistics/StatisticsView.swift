//
//  StatisticsView.swift
//  StepMeter
//
//  Created by Paweł Czapran on 29/05/2025.
//

import SwiftUI

struct StatisticsView: View {
    
    @StateObject private var viewModel = StatisticsViewModel()
    
    let navigateBack: () -> Void
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.green.opacity(0.3), Color.blue.opacity(0.3)],
                        startPoint: .leading,
                        endPoint: .trailing
            )
            .ignoresSafeArea()
            VStack(alignment: .center) {
                StatisticsHeaderView(navigateBack: navigateBack)
                Spacer()
                StatisticsInfoView(
                    stepCounts: viewModel.stepCounts,
                    maxSteps: viewModel.maxSteps,
                    shortDayName: viewModel.shortDayName
                )
                Spacer()
                StatisticsFooterView(avgSteps: viewModel.avgSteps)
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    StatisticsView(navigateBack: {})
}
