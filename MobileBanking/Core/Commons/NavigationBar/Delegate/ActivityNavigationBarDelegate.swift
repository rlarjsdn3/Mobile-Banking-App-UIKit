//
//  ActivityNavigationBarDelegate.swift
//  MobileBanking
//
//  Created by 김건우 on 6/29/25.
//

import UIKit

@MainActor
@objc protocol ActivityNavigationBarDelegate: AnyObject {

    /// 왼쪽 버튼이 탭되었을 때 호출됩니다.
    ///
    /// - Parameters:
    ///   - activityNavigationBar: 이벤트가 발생한 내비게이션 바입니다.
    ///   - button: 사용자가 탭한 왼쪽 버튼입니다.
    @objc optional func activityNavigationBar(
        _ activityNavigationBar: ActivityNavigationBar,
        didTapLeftButton button: UIButton
    )

    /// 오른쪽 버튼이 탭되었을 때 호출됩니다.
    ///
    /// - Parameters:
    ///   - activityNavigationBar: 이벤트가 발생한 내비게이션 바입니다.
    ///   - button: 사용자가 탭한 오른쪽 버튼입니다.
    @objc optional func activityNavigationBar(
        _ activityNavigationBar: ActivityNavigationBar,
        didTapRightButton button: UIButton
    )

    /// 오른쪽 버튼을 탭했을 때 표시할 메뉴를 반환합니다.
    ///
    /// - Parameters:
    ///   - activityNavigationBar: 메뉴를 표시할 내비게이션 바입니다.
    ///   - rightButton: 메뉴가 표시될 기준 버튼입니다.
    /// - Returns: 표시할 UIMenu 객체입니다. `nil`이면 메뉴를 표시하지 않습니다.
    @objc optional func activityNavigationBar(
        _ activityNavigationBar: ActivityNavigationBar,
        showsMenuAsPrimaryAction rightButton: UIButton
    ) -> UIMenu?
}
