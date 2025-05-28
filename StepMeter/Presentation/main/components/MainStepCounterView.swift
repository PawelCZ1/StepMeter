//
//  MainStepCounterView.swift
//  StepMeter
//
//  Created by Paweł Czapran on 27/05/2025.
//

import SwiftUI

struct MainStepCounterView: View {
    let steps: Int
    @Binding var selectedDate: Date
    
    var formattedDate: String {
            let calendar = Calendar.current
            if calendar.isDateInToday(selectedDate) {
                return "Today"
            } else if calendar.isDateInYesterday(selectedDate) {
                return "Yesterday"
            } else if calendar.isDateInTomorrow(selectedDate) {
                return "Tomorrow"
            } else {
                return selectedDate.formatted(.dateTime.day().weekday(.abbreviated))
            }
        }
    
    var body: some View {
        VStack {
            Text("Steps \(formattedDate)")
                .font(.headline)
            Text("\(steps)")
                .font(.largeTitle)
                .padding()
        }
    }
}

//#Preview {
//    @State var selectedDate = Date()
//    MainStepCounterView(steps: 0, selectedDate: $selectedDate)
//}
