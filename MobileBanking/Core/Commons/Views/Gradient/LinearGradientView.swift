//
//  LinearGradientView.swift
//  MobileBanking
//
//  Created by 김건우 on 7/6/25.
//

import UIKit

final class LinearGradientView: UIView {

    private var gradientLayer: CAGradientLayer!
    
    ///
    var colors: [UIColor] = [.systemBackground, .systemBackground.withAlphaComponent(0.0)] {
        didSet { gradientLayer.colors = colors.map { $0.cgColor } }
    }
    
    ///
    var startPoint: CGPoint = CGPoint(x: 0.5, y: 0.0) {
        didSet { gradientLayer.startPoint = startPoint }
    }
    
    ///
    var endPoint: CGPoint = CGPoint(x: 1.0, y: 0.0) {
        didSet { gradientLayer.endPoint = endPoint }
    }
    
    ///
    var locations: [NSNumber]? {
        didSet { gradientLayer.locations = locations }
    }

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

        apply(colors: colors)
        gradientLayer.frame = self.bounds
    }
}

extension LinearGradientView {
    
    /// <#Description#>
    /// - Parameters:
    ///   - colors: <#colors description#>
    ///   - startPoint: <#startPoint description#>
    ///   - endPoint: <#endPoint description#>
    func apply(
        colors: [UIColor],
        startPoint: CGPoint = CGPoint(x: 0.5, y: 0.0),
        endPoint: CGPoint = CGPoint(x: 0.5, y: 1.0),
        locations: [NSNumber]? = nil
    ) {
        self.colors = colors
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.locations = locations
    }
}
