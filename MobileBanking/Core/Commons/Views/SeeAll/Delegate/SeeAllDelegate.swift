//
//  SeeAllDelegate.swift
//  MobileBanking
//
//  Created by 김건우 on 6/26/25.
//

import UIKit

///
protocol SeeAllDelegate: AnyObject {

    ///
    func seeAllReusableView(
        _ view: SeeAllCollectionReusableView,
        didSelectSeeAllButton: UIButton
    )
}
