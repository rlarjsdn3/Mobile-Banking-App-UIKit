//
//  HomeNavigationBar.swift
//  MobileBanking
//
//  Created by 김건우 on 6/25/25.
//

import UIKit

///
final class HomeNavigationBar: NibView {

    ///
    @IBOutlet weak var profileImageView: UIImageView!
    ///
    @IBOutlet weak var titleLabel: UILabel!
    ///
    @IBOutlet weak var sqaureButton: UIButton!
    ///
    @IBOutlet weak var dotView: DotView!

    ///
    var isHiddenDotView: Bool = false {
        didSet { dotView.isHidden = isHiddenDotView }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib(owner: self)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2.0
        profileImageView.layer.masksToBounds = true
    }
}
