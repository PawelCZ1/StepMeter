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
    init(steps: Int, goalValue: Int) {
        self.steps = steps
        self.goalValue = goalValue
    }
    var body: some View {
        HStack {
            VStack {
                Text("Goal")
                Text("\(goalValue) steps")
            }
            .padding(.leading, 32)
            Spacer()
            VStack {
                Text("Until reached")
                Text("\(max(0, goalValue - steps)) steps")            }
            .padding(.trailing, 32)
        }
    }
}

#Preview {
    MainFooterView(steps: 2000, goalValue: 10000)
}
