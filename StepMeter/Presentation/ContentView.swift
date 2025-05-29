//
//  ContentView.swift
//  StepMeter
//
//  Created by Paweł Czapran on 27/05/2025.
//

import SwiftUI
import SwiftData

enum Destination: Hashable {
    case settings
}

struct ContentView: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            MainView(navigateToSettings: { path.append(Destination.settings) })
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                    case .settings:
                        SettingsView(navigateBack: { path.removeLast() })
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
