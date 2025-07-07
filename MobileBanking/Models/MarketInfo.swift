//
//  MarketInfo.swift
//  MobileBanking
//
//  Created by 김건우 on 7/7/25.
//

import Foundation

struct MarketInfo: Identifiable {

    let id = UUID()

    ///
    let title: String

    ///
    let totalAmount: Double

    ///
    let changeRate: Double
}

extension MarketInfo: Hashable {
}

extension MarketInfo {

    static let mock: [Self] = [
        .init(
            title: "Market Cap",
            totalAmount: 2_500_000_000,
            changeRate: 0.615
        ),
        .init(
            title: "24th Volume",
            totalAmount: 219_000_000_000,
            changeRate: -0.115
        ),
        .init(
            title: "BTC Dominance",
            totalAmount: 60_000_000_000,
            changeRate: 0.045
        )
    ]
}
