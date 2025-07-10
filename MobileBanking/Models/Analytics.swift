//
//  Analytics.swift
//  MobileBanking
//
//  Created by 김건우 on 7/6/25.
//

import Foundation

/// 사용자 분석 정보를 나타내는 모델입니다.
///
/// 아이콘 이름, 제목, 부제목 등의 정보를 담고 있으며,
/// 리스트나 뷰에 바인딩하기 위한 `Identifiable` 프로토콜을 채택하고 있습니다.
struct Analytics: Identifiable {

    /// 고유 식별자입니다. 각 인스턴스를 구분하기 위해 자동으로 UUID가 할당됩니다.
    let id = UUID()

    /// 시스템 이미지 이름입니다. SF Symbol 등의 아이콘 이름으로 사용됩니다.
    let systemName: String

    /// 표시할 제목입니다. 주요 정보를 간결하게 나타냅니다.
    let title: String

    /// 제목에 대한 보조 설명입니다. 추가적인 내용을 제공합니다.
    let subtitle: String
}

extension Analytics: Hashable {
}

extension Analytics {
    
    static let mock: [Self] = [
        .init(
            systemName: "chart.pie.fill",
            title: "Analytics",
            subtitle: "Spent $500 less then last month"
        ),
        .init(
            systemName: "arrow.uturn.left",
            title: "Cashback",
            subtitle: "$600 in June an last month 12,000"
        )
    ]
}
