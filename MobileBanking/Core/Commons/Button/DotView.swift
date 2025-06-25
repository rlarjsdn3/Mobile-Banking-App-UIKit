//
//  DotView.swift
//  MobileBanking
//
//  Created by 김건우 on 6/26/25.
//

import UIKit

final class DotView: NibView {

    private var circleLayer: CAShapeLayer?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib(owner: self)
    }
    
    override func draw(_ rect: CGRect) {
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
