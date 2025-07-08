//
//  CircleImageButton.swift
//  MobileBanking
//
//  Created by 김건우 on 7/3/25.
//

import UIKit

@available(*, deprecated, renamed: "TintedCircleButton")
final class CircleImageButton: NibView {

    @IBOutlet weak var circleButton: UIButton!

    var observation: NSKeyValueObservation?

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib(owner: self)
        setupAttributes()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        circleButton.layer.cornerRadius = circleButton.frame.width / 2
        circleButton.layer.masksToBounds = true
    }

    override func setupAttributes() {
        super.setupAttributes()

        defer { circleButton.layoutIfNeeded() }

        setImageEdgeInsets(10)
        setImage(.paypal, for: .normal)
        observation = circleButton.observe(\.isHighlighted, options: [.new]) { button, changed in
            Task { @MainActor in
                if let newValue = changed.newValue, newValue {
                    button.tintColor = .bankingSecondaryBackground
                    UIView.animate(withDuration: 0.075) {
                        button.backgroundColor = .systemGray.withAlphaComponent(0.1)
                    }
                } else {
                    button.tintColor = .bankingGray
                    UIView.animate(withDuration: 0.075) {
                        button.backgroundColor = .bankingBlue
                    }
                }
            }
        }
    }
}

extension CircleImageButton {

    func setImage(_ resource: ImageResource, for state: UIControl.State) {
        let image = UIImage(resource: resource)
            .withRenderingMode(.alwaysTemplate)
        circleButton.setImage(image, for: state)
    }
    
    func setImageEdgeInsets(_ all: CGFloat) {
        circleButton.imageEdgeInsets = .init(top: all, left: all, bottom: all, right: all)
    }
}
