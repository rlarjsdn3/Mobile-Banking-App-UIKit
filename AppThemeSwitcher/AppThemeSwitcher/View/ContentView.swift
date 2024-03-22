//
//  ContentView.swift
//  AppThemeSwitcher
//
//  Created by 김건우 on 3/19/24.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @Environment(\.colorScheme) var colorScheme
    
    @State private var presentThemeSwitcherView: Bool = false
    
    @AppStorage("appTheme") private var appTheme: AppTheme = .default
    
    // MARK: - Body
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
            ThemeSwitcherView(colorScheme: colorScheme)
                .presentationDetents([.height(410)])
                .presentationBackground(Color.clear)
        }
        .preferredColorScheme(appTheme.colorScheme)
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
