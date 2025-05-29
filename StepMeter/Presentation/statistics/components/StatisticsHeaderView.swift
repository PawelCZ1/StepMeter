//
//  StatisticsHeaderView.swift
//  StepMeter
//
//  Created by Paweł Czapran on 29/05/2025.
//

import SwiftUI

struct StatisticsHeaderView: View {
    let navigateBack: () -> Void
    var body: some View {
        ZStack(alignment: .center) {
            HStack {
                Button(action: navigateBack) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                .padding(.leading, 32)
                Spacer()
            }
            Text("Statistics")
                .font(.largeTitle)
        }
    }
}

#Preview {
    StatisticsHeaderView(navigateBack: {})
}
