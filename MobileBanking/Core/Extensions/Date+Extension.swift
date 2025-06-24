//
//  Date+Extension.swift
//  MobileBanking
//
//  Created by 김건우 on 6/25/25.
//

import Foundation

extension Date {

    /// 주어진 날짜 기준으로 특정 일 수 이전 또는 이후의 날짜를 반환합니다.
    ///
    /// - Parameters:
    ///   - value: 날짜에 더하거나 뺄 일 수입니다. 음수일 경우 과거, 양수일 경우 미래 날짜를 반환합니다.
    ///   - from: 기준 날짜입니다. 기본값은 현재 시각입니다.
    /// - Returns: 계산된 날짜. 계산에 실패하면 `nil`을 반환합니다.
    static func daysAgo(_ value: Int, from date: Date = .now) -> Date? {
        let calendar = Calendar.current
        return calendar.date(byAdding: .day, value: value, to: date)
    }
}
