//
//  ActivityViewController.swift
//  MobileBanking
//
//  Created by 김건우 on 6/24/25.
//

import UIKit

final class ActivityViewController: StoryboardViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var categoryBarView: CategoryBarView!
    @IBOutlet weak var navigationBar: ActivityNavigationBar!
    @IBOutlet weak var gradientView: LinearGradientView!
    

    override func setupAttributes() {
        super.setupAttributes()
        
        navigationBar.delegate = self
        categoryBarView.delegate = self
        categoryBarView.setSelectionCategory(.checking)
    }
}

extension ActivityViewController: CategoryBarViewDelegate {
    
    func categoryBarView(
        _ categoryBarView: CategoryBarView,
        didSelectCategory type: CategoryBarView.CategoryType
    ) {
        // TODO: - 선택된 카테고리에 따라 컨테이너 뷰 달리 바꾸기
        replaceChild(to: CheckingCollectionViewController(), container: containerView)
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
        _ activityNavigationBar: ActivityNavigationBar,
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
