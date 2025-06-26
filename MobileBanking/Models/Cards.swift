//
//  Cards.swift
//  MobileBanking
//
//  Created by 김건우 on 6/25/25.
//

import UIKit
import DeveloperToolsSupport

/// 결제 카드 정보를 표현하는 모델입니다.
/// 카드 소유자, 카드 브랜드 로고, 색상, 잔액, 카드 번호 등의 정보를 포함합니다.
struct Card: Identifiable {

    let id = UUID()

    /// 카드 소유자의 이름입니다.
    let ownerName: String

    /// 카드 브랜드 로고 이미지 리소스입니다.
    let logoResource: ImageResource

    /// 이미지 리소스를 기반으로 생성된 실제 카드 로고 이미지입니다.
    var cardLogo: UIImage {
        UIImage(resource: logoResource)
    }

    /// 카드에 남아 있는 사용 가능 잔액입니다.
    let availableBaleance: Double

    /// 카드 번호 또는 코드입니다. (마스킹된 형식 가능)
    let cardCode: String

    /// 카드 색상에 해당하는 컬러 리소스입니다.
    let colorResource: ColorResource

    /// 컬러 리소스를 기반으로 생성된 실제 카드 배경 색상입니다.
    var cardColor: UIColor {
        UIColor(resource: colorResource)
    }
}

extension Card: Hashable {
}

extension Card {

    static let mock: [Self] = [
        .init(
            ownerName: "Adom Shafi",
            logoResource: .visa,
            availableBaleance: 1532.75,
            cardCode: "1023",
            colorResource: .bankingBlue
        ),
        .init(
            ownerName: "Adom Shafi",
            logoResource: .mastercard,
            availableBaleance: 827.30,
            cardCode: "8845",
            colorResource: .bankingBlue
        ),
        .init(
            ownerName: "Adom Shafi",
            logoResource: .visa,
            availableBaleance: 294.10,
            cardCode: "4312",
            colorResource: .bankingBlue
        ),
        .init(
            ownerName: "Adom Shafi",
            logoResource: .mastercard,
            availableBaleance: 12005.00,
            cardCode: "7789",
            colorResource: .bankingBlue
        ),
        .init(
            ownerName: "Adom Shafi",
            logoResource: .visa,
            availableBaleance: 60.50,
            cardCode: "9901",
            colorResource: .bankingBlue
        )
    ]
}
