//
//  BankingTabBar.swift
//  MobileBanking
//
//  Created by 김건우 on 6/23/25.
//

import UIKit

final class BankingTabBar: UITabBar {

    var shapeLayer: CAShapeLayer?

    override func draw(_ rect: CGRect) {
        let capsule = UIBezierPath(
            roundedRect: rect,
            cornerRadius: rect.height / 2
        )

        if let oldShapeLayer = shapeLayer {
            oldShapeLayer.removeFromSuperlayer()
        }
        shapeLayer = CAShapeLayer()
        shapeLayer?.path = capsule.cgPath
        shapeLayer?.fillColor = UIColor.bankingBlack.resolvedColor(with: traitCollection).cgColor
        shapeLayer?.frame = rect
        self.layer.insertSublayer(shapeLayer!, at: 0)
    }
}
