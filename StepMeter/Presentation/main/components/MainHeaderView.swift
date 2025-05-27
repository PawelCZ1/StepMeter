//
//  MainHeaderView.swift
//  StepMeter
//
//  Created by Paweł Czapran on 27/05/2025.
//

import SwiftUI

struct MainHeaderView: View {
    
    var days: [Date]
    let calendar: Calendar
    
    let navigateToSettings: () -> Void

    init(navigateToSettings: @escaping () -> Void) {
        self.calendar = Calendar.current
        self.navigateToSettings = navigateToSettings
        let today = Date()
        self.days = []
        self.days = (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: today) }
    }

    var body: some View {
        VStack(alignment: .center) {
            ZStack {
                Text("StepMeter")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack {
                    Spacer()
                    Button(action: {
                        navigateToSettings()
                    }) {
                        Image(systemName: "gearshape")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    .padding(.trailing, 16)
                }
                
            }
            .frame(maxWidth: .infinity)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(days, id: \.self) { day in
                        VStack {
                            Text(day, format: .dateTime.day())
                                    .font(.title2)
                            Text(day, format: .dateTime.weekday(.abbreviated))
                                .font(.caption)
                        }
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(8)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    MainHeaderView(navigateToSettings: {})
}
