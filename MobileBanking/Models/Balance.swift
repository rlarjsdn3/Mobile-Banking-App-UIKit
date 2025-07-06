//
//  Balance.swift
//  MobileBanking
//
//  Created by 김건우 on 7/6/25.
//

import Foundation

struct Balance: Identifiable {
    
    let id = UUID()
    
    ///
    let title: String
    
    ///
    let totalAmount: Double
}

extension Balance: Hashable {
}

extension Balance {
    
    static let mock: [Self] = [
        .init(
            title: "Total balance",
            totalAmount: 25600.00
        ),
        .init(
            title: "Total Savings",
            totalAmount: 12800.00
        ),
        .init(
            title: "Total Deposit",
            totalAmount: 6400.00
        )
    ]
}
