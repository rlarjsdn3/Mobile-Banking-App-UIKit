//
//  HomeNavigationBar.swift
//  MobileBanking
//
//  Created by 김건우 on 6/25/25.
//

import UIKit

final class HomeNavigationBar: NibView {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sqaureButton: UIButton!
    @IBOutlet weak var dotView: DotView!

    private var observation: NSKeyValueObservation?

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib(owner: self)
        setupAttributes()
    }

    override func setupAttributes() {
        super.setupAttributes()

        let title = "Hello Adom!"
        titleLabel.attributedText = NSAttributedString(string: title)
            .font(ofSize: 20, weight: .bold, from: title.firstIndex(of: " "))
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2.0
        profileImageView.layer.masksToBounds = true
    }
}
