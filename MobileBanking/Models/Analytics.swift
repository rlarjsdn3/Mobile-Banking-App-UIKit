//
//  Analytics.swift
//  MobileBanking
//
//  Created by 김건우 on 7/6/25.
//

import Foundation

struct Analytics: Identifiable {
    
    let id = UUID()
    
    ///
    let systemName: String
    
    ///
    let title: String
    
    ///
    let subtitle: String
}

extension Analytics: Hashable {
}

extension Analytics {
    
    static let mock: [Self] = [
        .init(
            systemName: "chart.pie.fill",
            title: "Analytics",
            subtitle: "Spent $500 less then last month"
        ),
        .init(
            systemName: "arrow.uturn.left",
            title: "Cashback",
            subtitle: "$600 in June an last month 12,000"
        )
    ]
}
