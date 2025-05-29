//
//  StatisticsInfoView.swift
//  StepMeter
//
//  Created by Paweł Czapran on 29/05/2025.
//

import SwiftUI

struct StatisticsInfoView: View {
    
    let stepCounts: [Int]
    let maxSteps: Int
    let shortDayName: (Int) -> String
    
    var body: some View {
        VStack {
            Text("Previous Week")
                .font(.title)
                .fontWeight(.bold)
            HStack(alignment: .bottom, spacing: 12) {
                ForEach(0..<stepCounts.count, id: \.self) { index in
                    VStack {
                        Text("\(stepCounts[index])").scaledToFit()
                        Rectangle()
                        .fill(Color.blue)
                        .frame(
                            width: 40,
                            height: {
                                let rawHeight = CGFloat(stepCounts[index]) / CGFloat(maxSteps) * 360
                                return max(0, rawHeight.isFinite ? rawHeight : 0)
                            }())
                        Text(shortDayName(index))
                        .font(.caption)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    StatisticsInfoView(stepCounts: [3000, 6000, 4000, 5000, 4500, 5000, 2000], maxSteps: 10000, shortDayName: { index in return "Mon"})
}
