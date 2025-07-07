//
//  UIView+Extension.swift
//  MobileBanking
//
//  Created by 김건우 on 7/6/25.
//

import UIKit

extension UIView {
    
    /// <#Description#>
    /// - Parameters:
    ///   - strokeColor: <#strokeColor description#>
    ///   - lineWidth: <#lineWidth description#>
    func addDashedLine(strokeColor: UIColor, lineWidth: CGFloat) {
        backgroundColor = .clear
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.fillColor = UIColor.label.withAlphaComponent(0.0).cgColor
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineJoin = .round
        shapeLayer.lineDashPattern = [2, 2]

        let path = CGMutablePath()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        shapeLayer.path = path

        self.layer.addSublayer(shapeLayer)
    }
}
