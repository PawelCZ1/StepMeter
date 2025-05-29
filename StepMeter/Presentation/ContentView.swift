//
//  ContentView.swift
//  StepMeter
//
//  Created by Paweł Czapran on 27/05/2025.
//

import SwiftUI

enum Destination: Hashable {
    case settings
    case statistics
}

struct ContentView: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            MainView(
                navigateToSettings: { path.append(Destination.settings)
                },
                navigateToStatistics: {
                    path.append(Destination.statistics)
                }
            )
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                    case .settings:
                        SettingsView(navigateBack: { path.removeLast() })
                    case .statistics:
                        StatisticsView(navigateBack: { path.removeLast() })
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
