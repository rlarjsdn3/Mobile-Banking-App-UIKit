//
//  CategoryBarViewDelegate.swift
//  MobileBanking
//
//  Created by 김건우 on 6/29/25.
//

import UIKit

@MainActor
protocol CategoryBarViewDelegate: AnyObject {

    /// 사용자가 카테고리 바에서 항목을 선택했을 때 호출됩니다.
    ///
    /// - Parameters:
    ///   - categoryBarView: 이벤트가 발생한 `CategoryBarView` 인스턴스입니다.
    ///   - type: 선택된 카테고리 타입입니다.
    func categoryBarView(
        _ categoryBarView: CategoryBarView,
        didSelectCategory type: CategoryBarView.CategoryType
    )
}
