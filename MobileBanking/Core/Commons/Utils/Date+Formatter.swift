//
//  Date+Formatter.swift
//  MobileBanking
//
//  Created by 김건우 on 6/28/25.
//

import Foundation

extension Date {
    
    /// 자주 사용하는 날짜 포맷을 정의한 열거형입니다.
    enum Formatter: String {
        /// 시:분 (예: 14:30)
        case hhmma = "HH:mm a"
        /// 월.일.연도 (예: 06.28.2025)
        case MMddyyyy = "MM.dd.yyyy"
    }
    
    /// 정의된 포맷 스타일을 사용해 날짜를 문자열로 변환합니다.
    ///
    /// - Parameter style: `Date.Formatter` 열거형에 정의된 포맷 스타일
    /// - Returns: 지정된 스타일을 적용한 날짜 문자열
    func formatted(with style: Date.Formatter) -> String {
        formatted(with: style.rawValue)
    }
    
    /// 사용자 정의 포맷 문자열을 사용해 날짜를 문자열로 변환합니다.
    ///
    /// - Parameter format: `DateFormatter`에서 사용하는 포맷 문자열 (예: "yyyy-MM-dd")
    /// - Returns: 지정된 포맷을 적용한 날짜 문자열
    func formatted(with format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.amSymbol = "am"
        formatter.pmSymbol = "pm"
        formatter.locale = Locale(identifier: "en_us")
        return formatter.string(from: self)
    }
    
    /// 가능한 경우 상대 날짜 형식(예: "Today", "Yesterday")으로 날짜를 문자열로 반환합니다.
    ///
    /// 만약 상대 날짜 형식을 사용할 수 없는 경우(예: 미래 날짜 등), 전달된 `fallbackFormatStyle`을 사용하여 일반 날짜 문자열로 포맷합니다.
    ///
    /// - Parameter fallbackFormatStyle: 상대 날짜 포맷이 불가능할 경우 사용할 대체 포맷 스타일 (`Date.Formatter`)
    /// - Returns: 상대 날짜 또는 대체 포맷을 적용한 날짜 문자열. 포맷할 수 없다면 `nil` 반환
    func doesReleativeDateFormatted(with fallbackFormatStyle: Date.Formatter? = nil) -> String? {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .medium
        formatter.doesRelativeDateFormatting = true
        formatter.locale = Locale(identifier: "en_us")
        
        let string = formatter.string(from: self)
        if let _ = string.rangeOfCharacter(from: .decimalDigits) {
            guard let formatStyle = fallbackFormatStyle else { return nil }
            return formatted(with: formatStyle)
        } else {
            return string
        }
    }
}
