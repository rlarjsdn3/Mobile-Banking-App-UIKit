//
//  ThisWeek.swift
//  MobileBanking
//
//  Created by 김건우 on 6/25/25.
//

import Foundation

/// 이번 주 소비 요약 정보를 나타내는 모델입니다.
/// 총 소비 금액, 지난주 대비 차이, 변화 비율을 포함합니다.
struct WeeklySpending {

    /// 이번 주 총 소비 금액입니다.
    let totalAmount: Double

    /// 지난주와 비교한 금액 차이입니다. (양수: 증가, 음수: 감소)
    let amountDifference: Double

    /// 금액 차이에 대한 변화율입니다. (예: 0.025 → 2.5%)
    let changeRate: Double
}

extension WeeklySpending {

    /// 샘플 데이터
    static let mock: Self = .init(
        totalAmount: 45655.40,
        amountDifference: 569.82,
        changeRate: 0.0256
    )
}
