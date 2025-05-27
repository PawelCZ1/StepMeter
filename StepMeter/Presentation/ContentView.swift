//
//  ContentView.swift
//  StepMeter
//
//  Created by Paweł Czapran on 27/05/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State var isSettingsPresented: Bool = false
    
    var body: some View {
        if isSettingsPresented {
            SettingsView(navigateBack: {isSettingsPresented = false})
                
        } else {
            MainView(navigateToSettings: {isSettingsPresented = true})
        }
    }
}

#Preview {
    ContentView()
}
