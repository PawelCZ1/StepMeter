//
//  MainStepCounterView.swift
//  StepMeter
//
//  Created by Paweł Czapran on 27/05/2025.
//

import SwiftUI

struct MainStepCounterView: View {
    let steps: Int
    
    init(steps: Int) {
        self.steps = steps
    }
        
    var body: some View {
        VStack {
            Text("Steps Today")
                .font(.headline)
            Text("\(steps)")
                .font(.largeTitle)
                .padding()
        }
    }
}

#Preview {
    MainStepCounterView(steps: 0)
}
