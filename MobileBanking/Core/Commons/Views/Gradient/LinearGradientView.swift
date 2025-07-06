//
//  LinearGradientView.swift
//  MobileBanking
//
//  Created by 김건우 on 7/6/25.
//

import UIKit

final class LinearGradientView: UIView {

    private var gradientLayer: CAGradientLayer!

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        gradientLayer = CAGradientLayer()
        self.layer.addSublayer(gradientLayer)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupAttributes()
    }

    private func setupAttributes() {
        backgroundColor = .clear

        gradientLayer.colors = [
            UIColor.systemBackground.cgColor,
            UIColor.systemBackground.withAlphaComponent(0.0).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.frame = self.bounds
    }
}
