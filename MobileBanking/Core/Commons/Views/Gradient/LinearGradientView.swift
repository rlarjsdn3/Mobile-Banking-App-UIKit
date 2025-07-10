//
//  LinearGradientView.swift
//  MobileBanking
//
//  Created by 김건우 on 7/6/25.
//

import UIKit

final class LinearGradientView: UIView {

    private var gradientLayer: CAGradientLayer?

    ///
    var colors: [UIColor] = [.systemBackground, .systemBackground.withAlphaComponent(0.0)] {
        didSet { drawGraient() }
    }
    
    ///
    var startPoint: CGPoint = CGPoint(x: 0.5, y: 0.0) {
        didSet { drawGraient() }
    }
    
    ///
    var endPoint: CGPoint = CGPoint(x: 1.0, y: 0.0) {
        didSet { drawGraient() }
    }
    
    ///
    var locations: [NSNumber]? {
        didSet { drawGraient() }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupAttributes()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        drawGraient()
    }

    private func setupAttributes() {
        backgroundColor = .clear
    }

    private func drawGraient() {
        gradientLayer?.removeFromSuperlayer()

        gradientLayer = CAGradientLayer()
        gradientLayer?.colors = colors.map { $0.cgColor }
        gradientLayer?.startPoint = startPoint
        gradientLayer?.endPoint = endPoint
        gradientLayer?.locations = locations
        gradientLayer?.frame = self.bounds
        self.layer.insertSublayer(gradientLayer!, at: 0)
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
