//
//  SettingsHeaderView.swift
//  StepMeter
//
//  Created by Paweł Czapran on 27/05/2025.
//

import SwiftUI

struct SettingsHeaderView: View {
    let navigateBack: () -> Void
    var body: some View {
        ZStack(alignment: .center) {
            HStack {
                Button(action: {
                    navigateBack()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                .padding(.leading, 32)
                Spacer()
            }
            Text("Settings")
                .font(.largeTitle)
        }
    }
}

#Preview {
    SettingsHeaderView(navigateBack: {})
}
