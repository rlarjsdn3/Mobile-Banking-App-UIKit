//
//  SeeAllReusableViewDelegate.swift
//  MobileBanking
//
//  Created by 김건우 on 6/26/25.
//

import UIKit

@MainActor
protocol SeeAllReusableViewDelegate: AnyObject {

    /// "전체 보기" 버튼이 탭되었을 때 호출됩니다.
    ///
    /// - Parameters:
    ///   - view: 이벤트가 발생한 `SeeAllCollectionReusableView`입니다.
    ///   - didSelectSeeAllButton: 사용자가 탭한 "전체 보기" 버튼입니다.
    func seeAllReusableView(
        _ view: SeeAllCollectionReusableView,
        didSelectSeeAllButton: UIButton
    )
}
