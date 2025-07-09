//
//  HomeNavigationBar.swift
//  MobileBanking
//
//  Created by 김건우 on 6/25/25.
//

import UIKit

///
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

        let name = "Adom"
        titleLabel.attributedText = NSMutableAttributedString(string: "Hello \(name)!")
            .with(forKey: .font, of: "\(name)!", with: UIFont.systemFont(ofSize: 20, weight: .bold))
        observation = sqaureButton.observe(\.isHighlighted, options: [.new]) { [weak self] button, changed in
            Task { @MainActor in
                if let newValue = changed.newValue, newValue {
                    self?.dotView.circleOpacity = 0.75
                } else {
                    self?.dotView.circleOpacity = 1.0
                }
            }
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2.0
        profileImageView.layer.masksToBounds = true
    }
}
