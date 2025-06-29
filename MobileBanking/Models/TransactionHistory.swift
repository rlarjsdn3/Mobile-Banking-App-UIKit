//
//  TransactionHistory.swift
//  MobileBanking
//
//  Created by 김건우 on 6/23/25.
//

import UIKit
import DeveloperToolsSupport

/// 단일 거래 내역 정보를 표현하는 모델입니다.
/// 거래에 사용된 이미지, 제목, 날짜, 금액 정보를 포함합니다.
struct TransactionHistory: Identifiable {

    let id = UUID()

    /// 거래와 연관된 이미지 리소스입니다.
    let imageResource: ImageResource

    /// 이미지 리소스를 기반으로 생성된 실제 UIImage입니다.
    var image: UIImage {
        UIImage(resource: imageResource)
    }

    /// 거래 항목의 제목 또는 설명입니다.
    let title: String

    /// 거래가 발생한 날짜입니다.
    let date: Date

    /// 거래 금액입니다. (양수: 수입, 음수: 지출)
    let amount: Double
}

extension TransactionHistory: Hashable {
}

extension TransactionHistory {

    static let mock: [Self] = [
        .init(imageResource: .t1,    title: "Apple Store",       date: Date(), amount: -1299.0),
        .init(imageResource: .t2, title: "Facebook Ads",      date: .daysAgo(-1)!, amount: -300.0),
        .init(imageResource: .t3,  title: "Netflix Subscription", date: .daysAgo(-2)!, amount: -17.99),
        .init(imageResource: .t6,  title: "Twitter Blue",      date: .daysAgo(-3)!, amount: -8.0),
        .init(imageResource: .t4,   title: "NVIDIA GPU Purchase", date: .daysAgo(-4)!, amount: -999.0),

        .init(imageResource: .t5,    title: "iCloud Storage",    date: .daysAgo(-5)!, amount: -2.99),
        .init(imageResource: .t6, title: "Meta Revenue Share", date: .daysAgo(-6)!, amount: 150.0),
        .init(imageResource: .t1,  title: "Movie Refund",      date: .daysAgo(-7)!, amount: 15.0),
        .init(imageResource: .t6,  title: "Twitter Ad Credit", date: .daysAgo(-8)!, amount: 50.0),
        .init(imageResource: .t2,   title: "NVIDIA Developer Program", date: .daysAgo(-9)!, amount: -100.0),

        .init(imageResource: .t3,    title: "Apple Music",       date: .daysAgo(-10)!, amount: -10.99),
        .init(imageResource: .t4, title: "Facebook Marketplace Sale", date: .daysAgo(-11)!, amount: 75.0),
        .init(imageResource: .t5,  title: "Netflix Original Donation", date: .daysAgo(-12)!, amount: -5.0),
        .init(imageResource: .t1,  title: "X Premium",         date: .daysAgo(-13)!, amount: -8.0),
        .init(imageResource: .t6,   title: "NVIDIA AI Course",  date: .daysAgo(-14)!, amount: -199.0),

        .init(imageResource: .t1,    title: "MacBook Repair",    date: .daysAgo(-15)!, amount: -349.0),
        .init(imageResource: .t2, title: "Facebook Gaming Tip", date: .daysAgo(-16)!, amount: -20.0),
        .init(imageResource: .t3,  title: "Netflix Gift",      date: .daysAgo(-17)!, amount: 25.0),
        .init(imageResource: .t4,  title: "Twitter Sponsored Tweet", date: .daysAgo(-18)!, amount: -60.0),
        .init(imageResource: .t5,   title: "NVIDIA Refund",     date: .daysAgo(-19)!, amount: 200.0)
    ]
}
