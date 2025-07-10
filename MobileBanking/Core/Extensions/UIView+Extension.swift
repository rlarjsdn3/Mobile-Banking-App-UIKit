//
//  UIView+Extension.swift
//  MobileBanking
//
//  Created by 김건우 on 7/6/25.
//

import UIKit

extension UIView {
    
    /// 뷰 상단에 점선(Line)을 추가합니다.
    ///
    /// - Parameters:
    ///   - strokeColor: 점선의 색상입니다.
    ///   - lineWidth: 점선의 두께입니다.
    ///
    /// 해당 메서드는 뷰의 너비에 맞춰 상단에 점선을 그려주는 기능을 수행합니다.
    /// `CAShapeLayer`를 사용하여 구현되며, 점선 간격은 `[2, 2]`로 고정되어 있습니다.
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
