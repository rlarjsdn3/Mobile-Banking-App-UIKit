//
//  NSObject+Id.swift
//  MobileBanking
//
//  Created by 김건우 on 6/26/25.
//

import UIKit

extension NSObject {

    /// 클래스의 이름을 문자열로 반환합니다.
    ///
    /// 이 프로퍼티는 주로 셀 등록 시 재사용 식별자(`reuseIdentifier`) 등으로 활용됩니다.
    /// 예를 들어 `MyCustomCell.id`는 `"MyCustomCell"` 문자열을 반환합니다.
    static var id: String {
        NSStringFromClass(Self.self)
            .components(separatedBy: ".")
            .last!
    }
}
