//
//  AppTheme.swift
//  AppThemeSwitcher
//
//  Created by 김건우 on 3/19/24.
//

import SwiftUI

enum AppTheme: String, CaseIterable {
    case `default`
    case light
    case dark
    
    var title: String {
        switch self {
        case .default:
            return "Default"
        case .light:
            return "Light"
        case .dark:
            return "Dark"
        }
    }
    
    func mainColor(_ colorScheme: ColorScheme) -> Color {
        switch self {
        case .default:
            return colorScheme == .light ? .orange : .purple
        case .light:
            return .orange
        case .dark:
            return .purple
        }
    }
}
