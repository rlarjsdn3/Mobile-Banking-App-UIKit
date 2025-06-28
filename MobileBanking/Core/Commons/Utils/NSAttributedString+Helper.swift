//
//  NSAttributedString+Builder.swift
//  MobileBanking
//
//  Created by 김건우 on 6/28/25.
//

import UIKit

extension NSMutableAttributedString {
    
    /// 문자열의 지정한 인덱스 범위에 속성(key, value)을 적용합니다.
    ///
    /// - Parameters:
    ///   - key: 적용할 속성 키 (`.font`, `.foregroundColor`, `.underlineStyle` 등)
    ///   - startIndex: 속성 적용을 시작할 문자열의 시작 인덱스
    ///   - endIndex: 속성 적용을 끝낼 문자열의 종료 인덱스
    ///   - options: 문자열 비교 옵션 (기본값은 대소문자 무시)
    ///   - value: 적용할 속성 값 (예: `UIFont`, `UIColor`, `NSUnderlineStyle`)
    /// - Returns: 적용된 `NSMutableAttributedString` (체이닝 가능)
    @discardableResult
    func with<Value>(
        forKey key: NSAttributedString.Key,
        from startIndex: String.Index,
        to endIndex: String.Index,
        options: NSString.CompareOptions = [.caseInsensitive],
        with value: Value
    ) -> NSMutableAttributedString {
        guard startIndex < endIndex else { return self }
        let aString = String(string[startIndex..<endIndex])
        return with(forKey: key, of: aString, with: value)
    }
    
    /// <#Description#>
    /// - Parameters:
    ///   - key: <#key description#>
    ///   - startIndex: <#startIndex description#>
    ///   - endIndex: <#endIndex description#>
    ///   - options: <#options description#>
    ///   - value: <#value description#>
    /// - Returns: <#description#>
    @discardableResult
    func with<Value>(
        forKey key: NSAttributedString.Key,
        from startIndex: String.Index,
        through endIndex: String.Index,
        options: NSString.CompareOptions = [.caseInsensitive],
        with value: Value
    ) -> NSMutableAttributedString {
        guard startIndex <= endIndex else { return self }
        let aString = String(string[startIndex...endIndex])
        return with(forKey: key, of: aString, with: value)
    }
    
    /// 지정한 문자열 범위에 속성(key, value)을 적용하거나, 문자열이 없는 경우 전체 범위에 적용합니다.
    /// - Parameters:
    ///   - key: 적용할 속성 키 (`.foregroundColor`, `.font` 등)
    ///   - aString: 스타일을 적용할 대상 문자열 (옵셔널, 기본값은 nil)
    ///   - options: 문자열 비교 옵션 (기본값은 대소문자 무시)
    ///   - value: 적용할 속성 값 (예: `UIColor`, `UIFont`)
    /// - Returns: 적용된 `NSMutableAttributedString` (체이닝 가능)
    @discardableResult
    func with<Value>(
        forKey key: NSAttributedString.Key,
        of aString: String? = nil,
        with value: Value
    ) -> NSMutableAttributedString {
        if let aString, !aString.isEmpty {
            let targetRange = (string as NSString).range(of: aString, options: [.caseInsensitive])
            guard targetRange.location != NSNotFound else { return self }
            return with(forKey: key, in: targetRange, with: value)
        } else {
            return with(forKey: key, in: nil, with: value)
        }
    }
    
    /// 지정한 범위에 속성(key, value)을 적용합니다. 범위를 생략하면 전체 문자열에 적용됩니다.
    /// - Parameters:
    ///   - key: 적용할 속성 키
    ///   - range: 적용할 NSRange (기본값은 전체)
    ///   - value: 적용할 속성 값
    /// - Returns: 적용된 `NSMutableAttributedString` (체이닝 가능)
    @discardableResult
    func with<Value>(
        forKey key: NSAttributedString.Key,
        in range: NSRange?,
        with value: Value
    ) -> NSMutableAttributedString {
        let range = range ?? NSRange(location: 0, length: length)
        self.addAttribute(key, value: value, range: range)
        return self
    }
}
