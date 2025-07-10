//
//  LineChartsView.swift
//  MobileBanking
//
//  Created by 김건우 on 7/10/25.
//

import UIKit

final class LineChartsView: UIView {

    var values: [Double] = [] {
        didSet { drawCharts() }
    }

    var strokeColor: UIColor = .bankingGreen {
        didSet { drawCharts() }
    }

    private var lineChartsLayer: CAShapeLayer?
    private var dashedLineLayer: CAShapeLayer?

    override init(frame: CGRect) {
        super.init(frame: frame)
        comminInit()
    }

    convenience init(values: [Double]) {
        self.init(frame: .zero)
        self.values = values
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        comminInit()
    }

    private func comminInit() {
        self.layer.masksToBounds = true
    }

    private func drawCharts() {
        lineChartsLayer?.removeFromSuperlayer()
        dashedLineLayer?.removeFromSuperlayer()

        guard let minValue = values.min(),
              let maxValue = values.max(),
              let firstValau = values.first else {
            return
        }

        let viewHeight = self.frame.height
        let offsetX: CGFloat = self.frame.width / CGFloat(values.count)

        let paddingRatio: CGFloat = 0.1
        let padding = viewHeight * paddingRatio
        let availableHeight = viewHeight - (padding * 2)

        let lineChartsPath = UIBezierPath()
        for (index, value) in values.enumerated() {
            let x = offsetX * CGFloat(index)
            let y = padding + (1 - (value - minValue) / (maxValue - minValue)) * availableHeight // chatgpt helps.
            index == 0 ? lineChartsPath.move(to: CGPoint(x: x, y: y)) : lineChartsPath.addLine(to: CGPoint(x: x, y: y))
        }


        let dashedLinePath = UIBezierPath()

        let y = padding + (1 - (firstValau - minValue) / (maxValue - minValue)) * availableHeight
        dashedLinePath.move(to: CGPoint(x: 0, y: y))
        dashedLinePath.addLine(to: CGPoint(x: self.frame.width, y: y))

        dashedLineLayer = CAShapeLayer()
        dashedLineLayer?.path = dashedLinePath.cgPath
        dashedLineLayer?.strokeColor = UIColor.systemGray4.cgColor
        dashedLineLayer?.lineWidth = 1.25
        dashedLineLayer?.lineDashPattern = [2, 2]
        self.layer.addSublayer(dashedLineLayer!)

        lineChartsLayer = CAShapeLayer()
        lineChartsLayer?.path = lineChartsPath.cgPath
        lineChartsLayer?.fillColor = UIColor.clear.cgColor
        lineChartsLayer?.strokeColor = strokeColor.cgColor
        lineChartsLayer?.lineWidth = 1.25
        lineChartsLayer?.frame = self.bounds
        self.layer.addSublayer(lineChartsLayer!)
    }
}
