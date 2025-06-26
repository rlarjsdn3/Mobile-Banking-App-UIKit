//
//  Expenses.swift
//  MobileBanking
//
//  Created by 김건우 on 6/25/25.
//

import Foundation

/// 지출 내역을 나타내는 모델입니다.
/// 항목 제목, 부제목(설명), 금액 정보를 포함합니다.
struct Expense: Identifiable {

    let id = UUID()

    /// 지출 항목의 제목입니다. 예: "카페", "식비"
    let title: String

    /// 지출 항목에 대한 부가 설명 또는 위치입니다. 예: "스타벅스 강남점"
    let subtitle: String

    /// 지출 금액입니다. 단위는 보통 통화(예: 원, 달러)입니다.
    let amount: Double
}

extension Expense: Hashable {
}

extension Expense {

    static let mock: [Self] = [
        .init(
            title: "All Expense",
            subtitle: "Total expense of all time",
            amount: 60692.0
        ),
        .init(
            title: "Monthly Expense",
            subtitle: "Total expense this month only",
            amount: 7692.0
        ),
        .init(
            title: "Weekly Expense",
            subtitle: "Total expense this week only",
            amount: 643.0
        ),
        .init(
            title: "Daily Expense",
            subtitle: "Total expense today",
            amount: 96.0
        )
    ]
}
