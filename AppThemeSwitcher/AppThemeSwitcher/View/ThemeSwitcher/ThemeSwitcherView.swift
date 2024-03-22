//
//  ThemeSwitcherView.swift
//  AppThemeSwitcher
//
//  Created by 김건우 on 3/19/24.
//

import SwiftUI

struct ThemeSwitcherView: View {
    
    // MARK: - Properties
    var colorScheme: ColorScheme
    
    @AppStorage("appTheme") private var appTheme: AppTheme = .default
    
    @Namespace private var buttonAnimation: Namespace.ID
    
    @State private var circleOffset: CGSize = .zero
    
    // MARK: - Intializer
    init(colorScheme: ColorScheme) {
        self.colorScheme = colorScheme
        
        let isDarkMode = colorScheme == .dark
        let circleOffset = CGSize(
            width: isDarkMode ? 30 : 150,
            height: isDarkMode ? -25 : -150
        )
        self._circleOffset = State<CGSize>(initialValue: circleOffset)
    }
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 15) {
            Circle()
                .fill(appTheme.mainColor(colorScheme).gradient)
                .frame(width: 150, height: 150)
                // ⭐️ 마스킹을 해주는 Modifier
                .mask {
                    Rectangle()
                        .overlay {
                            Circle()
                                .offset(circleOffset)
                                .blendMode(.destinationOut)
                        }
                }
            
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
                                        .fill(Color(uiColor: UIColor.lightGray).opacity(0.33))
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
        .background(Color(uiColor: UIColor.systemBackground))
        .clipShape(.rect(cornerRadius: 30))
        .padding(.horizontal, 15)
        .environment(\.colorScheme, colorScheme)
        .onChange(of: colorScheme, initial: false) { _, newValue in
            let isDarkMode = newValue == .dark
            withAnimation(.bouncy) {
                circleOffset = CGSize(
                    width: isDarkMode ? 30 : 150,
                    height: isDarkMode ? -25 : -150
                )
            }
        }
    }
}

// MARK: - Preview
#Preview {
    ThemeSwitcherView(colorScheme: .light)
}
