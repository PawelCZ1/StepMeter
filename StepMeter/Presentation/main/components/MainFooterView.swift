//
//  MainFooterView.swift
//  StepMeter
//
//  Created by Paweł Czapran on 27/05/2025.
//

import SwiftUI

struct MainFooterView: View {
    let steps: Int
    let goalValue: Int
    let untilReached: Int
    init(steps: Int, goalValue: Int) {
        self.steps = steps
        self.goalValue = goalValue
        untilReached = max(0, goalValue - steps)
    }
    var body: some View {
        HStack {
            VStack {
                Text("Goal")
                Text("\(goalValue) steps")
            }
            .padding(.leading, 32)
            Spacer()
            if untilReached <= 0 {
                Text("Goal reached!")
                    .foregroundColor(.green)
                    .padding(.trailing, 32)
            } else {
                VStack {
                    Text("Until reached")
                    Text("\(untilReached) steps")
                }
                .padding(.trailing, 32)
            }
            
        }
    }
}

#Preview {
    MainFooterView(steps: 2000, goalValue: 10000)
}
