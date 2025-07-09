//
//  Number+Formatter.swift
//  MobileBanking
//
//  Created by 김건우 on 6/28/25.
//

import Foundation

extension NSNumber {
    
    /// 통화 금액 형식을 정의하기 위한 스타일 열거형입니다.
    ///  
    /// 통화 기호 위치, 양수/음수 기호, 소수점 자릿수 등을 조합하여 다양한 포맷을 유연하게 구성할 수 있습니다.
    enum Formatter {
        
        /// 사용자 정의 통화 포맷 형식
        ///
        /// - Parameters:
        ///   - plusSign: 양수일 때 표시할 접두 기호 (예: `"+"`, 기본값: `"+"`)
        ///   - minusSign: 음수일 때 표시할 접두 기호 (예: `"-"`, 기본값: `"-"`)
        ///   - currencySymbol: 사용할 통화 기호 (예: `"$"`, `"₩"`, `"€"`, 기본값: `"$"`)
        ///   - fractionalDigits: 소수점 이하 자릿수 (기본값: `2`)
        case currency(
            plusSign: String? = "+",
            minusSign: String? = "-",
            currencySymbol: String = "$",
            fractionalDigits: Int = 2
        )

        ///
        case percentage(
            plusSign: String = "",
            minusSign: String = "-",
            fractionalDigits: Int = 2
        )

        /// 양수 값에 적용할 포맷 문자열입니다.
        ///
        /// 내부적으로 사용자 정의 옵션을 반영하여 포맷 문자열을 구성합니다.
        var positiveFormat: String {
            switch self {
            case let .currency(p, _, c, d): return resolvedCurrencyFormat(p, c, d)
            case let .percentage(p, _, d): return resoslvedPercentFormat(p, d)
            }
        }
        
        /// 음수 값에 적용할 포맷 문자열입니다.
        ///
        /// 내부적으로 사용자 정의 옵션을 반영하여 포맷 문자열을 구성합니다.
        var negativeFormat: String {
            switch self {
            case let .currency(_, m, c, d): return resolvedCurrencyFormat(m, c, d)
            case let .percentage(_, m, d): return resoslvedPercentFormat(m, d)
            }
        }
    }
    
    /// 지정한 스타일에 따라 숫자를 통화 문자열로 변환합니다.
    ///
    /// - Parameter style: 통화 형식 스타일 (`plainDollar`, `signedDollar` 중 선택)
    /// - Returns: 지정한 스타일이 적용된 통화 문자열 (예: `$1,000.00`, `-$500.00`). 변환에 실패하면 `nil`을 반환합니다.
    func formatted(with style: NSNumber.Formatter) -> String? {
            switch style {
            case .percentage:
                return formatted(
                    positiveFormat: style.positiveFormat,
                    negativeFormat: style.negativeFormat
                )
            default:
                return formatted(
                    positiveFormat: style.positiveFormat,
                    negativeFormat: style.negativeFormat
                )
            }
        }

    /// 지정한 양수/음수 포맷 문자열을 사용해 숫자를 문자열로 변환합니다.
    ///
    /// - Parameters:
    ///   - positiveFormat: 양수 값에 적용할 포맷 문자열 (예: `"+$#,##0.00"`)
    ///   - negativeFormat: 음수 값에 적용할 포맷 문자열 (예: `"-$#,##0.00"`)
    /// - Returns: 지정된 포맷이 적용된 문자열. 포맷팅에 실패하면 `nil`을 반환합니다.
    func formatted(positiveFormat: String, negativeFormat: String) -> String? {
        let formatter = NumberFormatter()
        formatter.positiveFormat = positiveFormat
        formatter.negativeFormat = negativeFormat
        return formatter.string(from: self)
    }
}

extension NSNumber.Formatter {

    private func resolvedCurrencyFormat(_ s: String?, _ c: String, _ f: Int) -> String {
        sign(s) + c + "#,##0" + fractionalDigits(f)
    }

    private func resoslvedPercentFormat(_ s: String, _ f: Int) -> String {
        sign(s) + "0" + fractionalDigits(f) + "%" // 내부적으로 100을 곱함
    }

    private func sign(_ sign: String?) -> String { sign ?? "" }

    private func fractionalDigits(_ digits: Int) -> String {
        guard digits > 0 else { return "" }
        return "." + String(Array(repeating: "0", count: digits))
    }
}
