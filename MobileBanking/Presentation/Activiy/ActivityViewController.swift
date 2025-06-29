//
//  ActivityViewController.swift
//  MobileBanking
//
//  Created by 김건우 on 6/24/25.
//

import UIKit

final class ActivityViewController: StoryboardViewController {

    @IBOutlet weak var navigationBar: ActivityNavigationBar!

    override func setupAttributes() {
        super.setupAttributes()

        navigationBar.delegate = self
    }
}

extension ActivityViewController: ActivityNavigationBarDelegate {

    func activityNavigationBar(
        _ activityNavigationBar: ActivityNavigationBar,
        didTapLeftButton button: UIButton
    ) {
        navigationController?.popViewController(animated: true)
    }

    func activityNavigationBar(
        activityNavigationBar: ActivityNavigationBar,
        showsMenuAsPrimaryAction rightButton: UIButton
    ) -> UIMenu? {
        let topAction = [
            UIAction(
                title: "Share",
                image: UIImage(systemName: "square.and.arrow.up"),
                handler: { _ in }
            ),
            UIAction(
                title: "Contact Support",
                image: UIImage(systemName: "message"),
                handler: { _ in }
            )
        ]

        let divider = UIMenu(options: .displayInline, children: topAction)

        let reportIssueAction = UIAction(
            title: "Report an Issue",
            image: UIImage(systemName: "exclamationmark.bubble"),
            attributes: .destructive,
            handler: { _ in }
        )

        return UIMenu(
            title: "",
            children: [divider, reportIssueAction]
        )
    }
}
