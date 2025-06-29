//
//  ActivityNavigationBarDelegate.swift
//  MobileBanking
//
//  Created by 김건우 on 6/29/25.
//

import UIKit

///
@MainActor
@objc protocol ActivityNavigationBarDelegate: AnyObject {
    
    /// <#Description#>
    /// - Parameters:
    ///   - activityNavigationBar: <#activityNavigationBar description#>
    ///   - button: <#button description#>
    @objc optional func activityNavigationBar(
        _ activityNavigationBar: ActivityNavigationBar,
        didTapLeftButton button: UIButton
    )
    
    /// <#Description#>
    /// - Parameters:
    ///   - aµctivityNavigationBar: <#aµctivityNavigationBar description#>
    ///   - button: <#button description#>
    @objc optional func activityNavigationBar(_ activityNavigationBar: ActivityNavigationBar, didTapRightButton button: UIButton
    )
    
    /// <#Description#>
    /// - Parameters:
    ///   - activityNavigationBar: <#activityNavigationBar description#>
    ///   - rightButton: <#rightButton description#>
    /// - Returns: <#description#>
    @objc optional func activityNavigationBar(
        activityNavigationBar: ActivityNavigationBar,
        showsMenuAsPrimaryAction rightButton: UIButton
    ) -> UIMenu?
}
