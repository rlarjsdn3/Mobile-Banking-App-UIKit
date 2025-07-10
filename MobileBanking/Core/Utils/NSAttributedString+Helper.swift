//
//  NSAttributedString+Builder.swift
//  MobileBanking
//
//  Created by 김건우 on 6/28/25.
//

import UIKit

extension NSAttributedString {

    /// 지정한 범위에 원하는 크기와 굵기의 글꼴을 적용합니다.
    ///
    /// - Parameters:
    ///   - size: 적용할 글꼴 크기입니다. 생략하면 기존 크기를 유지하거나 기본 본문 스타일 크기를 사용합니다.
    ///   - weight: 적용할 글꼴의 굵기입니다.
    ///   - startIndex: 속성 적용을 시작할 문자열의 시작 인덱스입니다. 기본값은 전체 범위의 시작입니다.
    ///   - endIndex: 속성 적용을 종료할 문자열의 끝 인덱스입니다. 기본값은 전체 범위의 끝입니다.
    /// - Returns: 글꼴 속성이 적용된 새로운 `NSAttributedString` 객체입니다.
    @discardableResult
    func font(
        ofSize size: CGFloat? = nil,
        weight: UIFont.Weight,
        from startIndex: String.Index? = nil,
        to endIndex: String.Index? = nil
    ) -> NSAttributedString {
        let attr = NSMutableAttributedString(attributedString: self)
        let font = self.attribute(.font, at: 0, effectiveRange: nil) as? UIFont
        let ptSize = size ?? font?.pointSize ?? UIFont.preferredFont(forTextStyle: .body).pointSize
        attr.with(forKey: .font, from: startIndex, to: endIndex, with: UIFont.systemFont(ofSize: ptSize, weight: weight))
        return attr
    }

    /// 지정한 범위에 텍스트 색상을 적용합니다.
    ///
    /// - Parameters:
    ///   - color: 적용할 텍스트 색상입니다.
    ///   - startIndex: 색상 적용을 시작할 문자열의 시작 인덱스입니다. 기본값은 전체 범위의 시작입니다.
    ///   - endIndex: 색상 적용을 종료할 문자열의 끝 인덱스입니다. 기본값은 전체 범위의 끝입니다.
    /// - Returns: 색상이 적용된 새로운 `NSAttributedString` 객체입니다.
    func forergroundColor(
        _ color: UIColor,
        from startIndex: String.Index? = nil,
        to endIndex: String.Index? = nil
    ) -> NSAttributedString {
        var attr = NSMutableAttributedString(attributedString: self)
        attr.with(forKey: .foregroundColor, from: startIndex, to: endIndex, with: color)
        return attr
    }
}

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
        from startIndex: String.Index?,
        to endIndex: String.Index?,
        options: NSString.CompareOptions = [.caseInsensitive],
        with value: Value
    ) -> NSMutableAttributedString {

        let aString: String = {
            switch (startIndex, endIndex) {
            case let (.some(start), .some(end)) where start < end: return String(string[start..<end])
            case let (.some(start), .none): return String(string[start...])
            case let (.none, .some(end)):   return  String(string[..<end])
            default: return ""
            }
        }()
        return with(forKey: key, of: aString, with: value)
    }

    /// 지정한 문자열 범위에 속성을 적용합니다.
    ///
    /// - Parameters:
    ///   - key: 적용할 속성 키입니다. 예: `.font`, `.foregroundColor`, `.underlineStyle` 등
    ///   - startIndex: 속성 적용을 시작할 문자열의 시작 인덱스입니다. 생략하면 문자열 처음부터 적용됩니다.
    ///   - endIndex: 속성 적용을 종료할 문자열의 끝 인덱스입니다. 생략하면 문자열 끝까지 적용됩니다.
    ///   - options: 문자열 비교에 사용할 옵션입니다. 기본값은 대소문자 구분 없음입니다.
    ///   - value: 적용할 속성 값입니다.
    /// - Returns: 속성이 적용된 새로운 `NSMutableAttributedString` 객체입니다.
    ///
    /// 해당 메서드는 지정한 범위 내 텍스트를 추출한 후,
    /// 해당 문자열을 기준으로 속성을 설정합니다.
    @discardableResult
    func with<Value>(
        forKey key: NSAttributedString.Key,
        from startIndex: String.Index?,
        through endIndex: String.Index?,
        options: NSString.CompareOptions = [.caseInsensitive],
        with value: Value
    ) -> NSMutableAttributedString {

        let aString: String = {
            switch (startIndex, endIndex) {
            case let (.some(start), .some(end)) where start < end: return String(string[start...end])
            case let (.some(start), .none): return String(string[start...])
            case let (.none, .some(end)):   return  String(string[..<end])
            default: return ""
            }
        }()
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


fileprivate extension Optional where Wrapped == String.Index? {

    static func < (lhs: String.Index?, rhs: String.Index?) -> Bool {
        guard let lhs = lhs, let rhs = rhs else {
            return false
        }
        return lhs < rhs
    }
}
