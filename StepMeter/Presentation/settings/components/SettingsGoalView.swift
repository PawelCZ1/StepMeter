//
//  SettingsGoalView.swift
//  StepMeter
//
//  Created by Paweł Czapran on 27/05/2025.
//

import SwiftUI

struct SettingsGoalView: View {
    
    let goalValue: Int
    let onEdit: () -> Void
    
    var body: some View {
        HStack(alignment: .center) {
            VStack {
                Text("Goal")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("\(goalValue)")
                    .font(.largeTitle)
            }
            .padding()
            .background(Color.blue.opacity(0.1))
            .cornerRadius(8)
            Button(action: onEdit) {
                Text("Edit")
                    .font(.title)
            }
            .padding()
            .foregroundColor(.black)
        }
        
    }
}

#Preview {
    SettingsGoalView(goalValue: 10000, onEdit: {})
}
