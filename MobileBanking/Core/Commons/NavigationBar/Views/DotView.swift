//
//  DotView.swift
//  MobileBanking
//
//  Created by 김건우 on 6/26/25.
//

import UIKit

final class DotView: UIView {

    private var circleLayer: CAShapeLayer?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .systemBackground
    }
    
    override func draw(_ rect: CGRect) {
        circleLayer?.removeFromSuperlayer()

        let inset = 2.5
        let insetedRect = rect.insetBy(dx: inset, dy: inset)
        let circle = UIBezierPath(ovalIn: insetedRect)

        circleLayer = CAShapeLayer()
        circleLayer?.path = circle.cgPath
        circleLayer?.fillColor = UIColor.systemBackground.cgColor
        circleLayer?.strokeColor = UIColor.systemRed.cgColor
        circleLayer?.lineWidth = 2.25
        circleLayer?.frame = rect

        self.layer.addSublayer(circleLayer!)
    }
}
