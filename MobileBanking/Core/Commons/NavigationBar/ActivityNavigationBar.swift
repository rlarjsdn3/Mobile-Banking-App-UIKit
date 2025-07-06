//
//  ActivityNavigationBar.swift
//  MobileBanking
//
//  Created by 김건우 on 6/29/25.
//

import UIKit

final class ActivityNavigationBar: NibView {

    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!

    var isMenuReloaded: Bool = false

    ///
    weak var delegate: (any ActivityNavigationBarDelegate)?

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib(owner: self)
        setupAttributes()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        // Delegate is nil during init, so defer menu setup to layoutSubviews.
        // Use isMenuReloaded to avoid repeated setup on multiple calls.
        if !isMenuReloaded {
            setupMenuButton()
            isMenuReloaded = true
        }
    }

    private func setupMenuButton() {
        if let menu = delegate?.activityNavigationBar?(
            self,
            showsMenuAsPrimaryAction: rightButton
        ) {
            rightButton.menu = menu
            rightButton.showsMenuAsPrimaryAction = true
        }
    }

    @IBAction func didTapLeftButton(_ sender: UIButton) {
        delegate?.activityNavigationBar?(self, didTapLeftButton: sender)
    }

    @IBAction func didTapRightButton(_ sender: UIButton) {
        delegate?.activityNavigationBar?(self, didTapRightButton: sender)
    }
}
