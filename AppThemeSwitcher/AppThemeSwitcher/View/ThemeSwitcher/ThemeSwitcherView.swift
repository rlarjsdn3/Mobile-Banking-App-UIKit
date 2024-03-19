//
//  ThemeSwitcherView.swift
//  AppThemeSwitcher
//
//  Created by 김건우 on 3/19/24.
//

import SwiftUI

struct ThemeSwitcherView: View {
    
    // MARK: - Properties
    @Environment(\.colorScheme) var colorScheme
    
    @AppStorage("appTheme") private var appTheme: AppTheme = .default
    
    @Namespace private var buttonAnimation: Namespace.ID
    
    var body: some View {
        VStack(spacing: 15) {
            Circle()
                .fill(appTheme.mainColor(colorScheme).gradient)
                .frame(width: 150, height: 150)
            
            Text("Choose a Style")
                .font(.title2)
                .bold()
            
            Text("Pop or subtle, Day or night.\nCustomize your interface.")
                .multilineTextAlignment(.center)
            
            HStack(spacing: 0) {
                ForEach(AppTheme.allCases, id: \.rawValue) { theme in
                    Text(theme.title)
                        .padding(.vertical, 10)
                        .frame(width: 100)
                        .background {
                            ZStack {
                                if appTheme == theme {
                                    Capsule()
                                        .fill(Color.white)
                                        .matchedGeometryEffect(id: "button", in: buttonAnimation)
                                }
                            }
                            .animation(.snappy, value: appTheme)
                        }
                        .contentShape(.rect)
                        .onTapGesture {
                            appTheme = theme
                        }
                }
            }
            .padding(3)
            .background(Color.primary.opacity(0.06), in: .capsule)
            .padding(.top, 20)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 410)
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 30))
        .padding(.horizontal, 15)
    }
}

#Preview {
    ThemeSwitcherView()
}
