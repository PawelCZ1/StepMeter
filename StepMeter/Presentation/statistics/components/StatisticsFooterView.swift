//
//  StatisticsFooterView.swift
//  StepMeter
//
//  Created by Paweł Czapran on 29/05/2025.
//

import SwiftUI

struct StatisticsFooterView: View {
    
    let avgSteps: Int
    
    var body: some View {
        HStack {
            Text("Average Steps")
                .padding(16)
            Spacer()
            Text("\(avgSteps)")
                .padding(16)
        }
        .background(Color.green.opacity(0.1))
        .cornerRadius(8)
        .padding(.horizontal, 32)
        .padding(.bottom, 32)
    }
}

#Preview {
    StatisticsFooterView(avgSteps: 5000)
}
