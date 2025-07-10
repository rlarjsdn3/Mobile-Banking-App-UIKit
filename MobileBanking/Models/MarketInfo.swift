//
//  MarketInfo.swift
//  MobileBanking
//
//  Created by 김건우 on 7/7/25.
//

import Foundation

/// 특정 시장 항목의 자산 정보와 변동률을 나타내는 모델입니다.
///
/// 예금, 주식, 가상자산 등 다양한 항목에 대해 제목, 총액, 변화율을 포함하고 있습니다.
struct MarketInfo: Identifiable {

    /// 고유 식별자입니다. 각 항목을 구분하기 위해 UUID가 자동으로 생성됩니다.
    let id = UUID()

    /// 항목의 이름 또는 제목입니다. 예: "비트코인", "적금", "나스닥 지수" 등
    let title: String

    /// 해당 항목의 총 자산 금액입니다.
    let totalAmount: Double

    /// 자산의 변화율입니다. 양수일 경우 상승, 음수일 경우 하락을 나타냅니다.
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
