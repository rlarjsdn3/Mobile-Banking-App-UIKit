//
//  Savings.swift
//  MobileBanking
//
//  Created by 김건우 on 6/25/25.
//

import UIKit
import DeveloperToolsSupport

/// 사용자의 예금 또는 적금 정보를 나타내는 모델입니다.
/// 이미지, 제목, 종류, 만기일, 총 금액 정보를 포함합니다.
struct Saving {

    /// 상품을 시각적으로 나타내는 이미지 리소스입니다.
    let imageResource: ImageResource

    /// 이미지 리소스를 기반으로 생성된 실제 UIImage입니다.
    var image: UIImage {
        UIImage(resource: imageResource)
    }

    /// 예금 또는 적금의 이름 또는 설명입니다.
    let title: String

    /// 예금/적금의 종류를 나타냅니다.
    let savingType: SavingType

    /// 만기일을 나타내는 날짜입니다.
    let expirationDate: Date

    /// 만기 시 총 금액 또는 목표 금액입니다.
    let totalAmount: Double
}

extension Saving {

    /// 예금 또는 적금의 타입을 정의하는 열거형입니다.
    enum SavingType {
        /// 예금 (일시에 넣고 만기까지 유지)
        case deposit
        /// 적금 (정기적으로 불입하는 방식)
        case savings

        /// 각 타입에 대한 표시용 이름입니다.
        var name: String {
            switch self {
            case .deposit: return "Deposit"
            case .savings: return "Savings"
            }
        }
    }
}

extension Saving {

    static let mock: [Self] = [
        .init(
            imageResource: .home,
            title: "Home Deposit Plan",
            savingType: .deposit,
            expirationDate: .daysAgo(12)!,
            totalAmount: 10000.0
        ),
        .init(
            imageResource: .vacation,
            title: "Vacation Savings",
            savingType: .savings,
            expirationDate: .daysAgo(6)!,
            totalAmount: 3000.0
        ),
        .init(
            imageResource: .money,
            title: "Emergency Fund",
            savingType: .deposit,
            expirationDate: .daysAgo(24)!,
            totalAmount: 15000.0
        ),
        .init(
            imageResource: .car,
            title: "New Car Goal",
            savingType: .savings,
            expirationDate: .daysAgo(18)!,
            totalAmount: 12000.0
        ),
        .init(
            imageResource: .education,
            title: "Education Savings",
            savingType: .savings,
            expirationDate: .daysAgo(36)!,
            totalAmount: 20000.0
        )
    ]
}
