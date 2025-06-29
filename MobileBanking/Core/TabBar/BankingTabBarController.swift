//
//  BankingTabBarController.swift
//  MobileBanking
//
//  Created by 김건우 on 6/23/25.
//

import UIKit

final class BankingTabBarController: UITabBarController {

    let tabHeight: CGFloat = 95.0

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBarAppearance()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        self.tabBar.frame.size.height = tabHeight
        self.tabBar.frame.origin.y = view.frame.height - tabHeight
    }

    private func setupTabBarAppearance() {
        let appearance = UITabBarAppearance()

        let attributesNormal: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12, weight: .semibold),
            .foregroundColor: UIColor.gray
        ]

        let attributesSelected: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12, weight: .semibold),
            .foregroundColor: UIColor.white
        ]

        let itemAppearance = UITabBarItemAppearance()
        itemAppearance.normal.iconColor = .gray
        itemAppearance.normal.titleTextAttributes = attributesNormal
        itemAppearance.normal.titlePositionAdjustment = .init(horizontal: 0, vertical: 5)
        itemAppearance.selected.iconColor = .white
        itemAppearance.selected.titleTextAttributes = attributesSelected
        itemAppearance.selected.titlePositionAdjustment = .init(horizontal: 0, vertical: 5)

        appearance.stackedLayoutAppearance = itemAppearance
        appearance.compactInlineLayoutAppearance = itemAppearance
        appearance.inlineLayoutAppearance = itemAppearance

        self.tabBar.standardAppearance = appearance
        self.tabBar.scrollEdgeAppearance = appearance
    }
}
