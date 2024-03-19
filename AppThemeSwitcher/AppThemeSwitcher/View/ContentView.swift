//
//  ContentView.swift
//  AppThemeSwitcher
//
//  Created by 김건우 on 3/19/24.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @State private var presentThemeSwitcherView: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Appearance") {
                    Button("Change Theme") {
                        presentThemeSwitcherView.toggle()
                    }
                }
            }
            .navigationTitle("Setting")
        }
        .sheet(isPresented: $presentThemeSwitcherView) {
            ThemeSwitcherView()
                .presentationDetents([.height(410)])
                .presentationBackground(Color.clear)
        }
    }
}

#Preview {
    ContentView()
}
