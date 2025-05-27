//
//  MainFooterView.swift
//  StepMeter
//
//  Created by Paweł Czapran on 27/05/2025.
//

import SwiftUI

struct MainFooterView: View {
    let steps: Int
    init(steps: Int) {
        self.steps = steps
    }
    var body: some View {
        HStack {
            VStack {
                Text("Goal")
                Text("10,000 steps")
            }
            .padding(.leading, 32)
            Spacer()
            VStack {
                Text("Until reached")
                Text("\(max(0, 10_000 - steps)) steps")            }
            .padding(.trailing, 32)
        }
    }
}

#Preview {
    MainFooterView(steps: 2000)
}
