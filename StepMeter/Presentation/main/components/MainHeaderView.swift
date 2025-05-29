//
//  MainHeaderView.swift
//  StepMeter
//
//  Created by Paweł Czapran on 27/05/2025.
//

import SwiftUI

struct MainHeaderView: View {
    
    private var days: [Date] {
        let today = calendar.startOfDay(for: Date())
        return (-7..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: today) }
    }
    private let calendar = Calendar.current
    
    @Binding var selectedDate: Date
    let onDateSelected: (Date) -> Void
    let navigateToSettings: () -> Void
    let navigateToStatistics: () -> Void

//    init(onDateSelected: @escaping (Date) -> Void, navigateToSettings: @escaping () -> Void) {
//        self.calendar = Calendar.current
//        self.onDateSelected = onDateSelected
//        self.navigateToSettings = navigateToSettings
//        let today = Date()
//        self.days = []
//        self.days = (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: today) }
//    }

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
            ScrollViewReader { proxy in
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
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(day == selectedDate ? Color.blue : Color.clear, lineWidth: 2)
                            )
                            .onTapGesture {
                                onDateSelected(day)
                            }
                        }
                    }
                    .padding()
                }
                .onAppear {
                    let today = calendar.startOfDay(for: Date())
                    proxy.scrollTo(today, anchor: .center)
                }
            }
            Button(action: navigateToStatistics) {
                    Text("View Statistics")
                        .font(.title2)
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(8)
                        .foregroundColor(.black)
            }
        }
    }
}

//#Preview {
////    MainHeaderView(selectedDate: <#Binding<Date>#>, onDateSelected: { _ in }, navigateToSettings: {})
//}
