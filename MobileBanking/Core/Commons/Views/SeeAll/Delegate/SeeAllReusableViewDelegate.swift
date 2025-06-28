//
//  SeeAllReusableViewDelegate.swift
//  MobileBanking
//
//  Created by 김건우 on 6/26/25.
//

import UIKit

///
@MainActor
protocol SeeAllReusableViewDelegate: AnyObject {

    ///
    func seeAllReusableView(
        _ view: SeeAllCollectionReusableView,
        didSelectSeeAllButton: UIButton
    )
}
