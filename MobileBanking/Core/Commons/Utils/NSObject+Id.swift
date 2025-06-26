//
//  NSObject+Id.swift
//  MobileBanking
//
//  Created by 김건우 on 6/26/25.
//

import UIKit

extension NSObject {

    ///
    static var id: String {
        NSStringFromClass(Self.self)
            .components(separatedBy: ".")
            .last!
    }
}
