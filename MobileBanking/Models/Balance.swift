//
//  Balance.swift
//  MobileBanking
//
//  Created by 김건우 on 7/6/25.
//

import Foundation

/// 자산 또는 계좌의 잔액 정보를 나타내는 모델입니다.
///
/// 계좌 제목과 총액을 포함하며, 리스트 바인딩 등을 위해 `Identifiable` 프로토콜을 채택하고 있습니다.
struct Balance: Identifiable {

    /// 고유 식별자입니다. 각 인스턴스를 구분하기 위해 자동으로 UUID가 생성됩니다.
    let id = UUID()

    /// 잔액 항목의 제목입니다. 예: "예금", "적금", "코인" 등
    let title: String

    /// 해당 항목의 총 금액입니다.
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
