//
//  CategoryBarViewDelegate.swift
//  MobileBanking
//
//  Created by 김건우 on 6/29/25.
//

import UIKit

@MainActor
protocol CategoryBarViewDelegate: AnyObject {
    
    /// <#Description#>
    /// - Parameters:
    ///   - categoryBarView: <#categoryBarView description#>
    ///   - type: <#type description#>
    func categoryBarView(
        _ categoryBarView: CategoryBarView,
        didSelectCategory type: CategoryBarView.CategoryType
    )
}
