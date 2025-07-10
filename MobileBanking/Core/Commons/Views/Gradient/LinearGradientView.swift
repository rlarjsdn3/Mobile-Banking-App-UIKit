//
//  LinearGradientView.swift
//  MobileBanking
//
//  Created by 김건우 on 7/6/25.
//

import UIKit

final class LinearGradientView: UIView {

    private var gradientLayer: CAGradientLayer?

    /// 그라디언트에 사용할 색상 배열입니다.
    ///
    /// 기본값은 위에서 아래로 흐르는 투명한 시스템 배경색입니다.
    /// 색상이 변경되면 자동으로 뷰에 다시 그려집니다.
    var colors: [UIColor] = [.systemBackground, .systemBackground.withAlphaComponent(0.0)] {
        didSet { drawGraient() }
    }

    /// 그라디언트의 시작점을 나타냅니다.
    ///
    /// 값은 0.0 ~ 1.0 사이의 상대 좌표이며, 기본값은 위쪽 중앙입니다.
    /// 변경 시 그라디언트가 다시 그려집니다.
    var startPoint: CGPoint = CGPoint(x: 0.5, y: 0.0) {
        didSet { drawGraient() }
    }

    /// 그라디언트의 끝점을 나타냅니다.
    ///
    /// 값은 0.0 ~ 1.0 사이의 상대 좌표이며, 기본값은 오른쪽 중앙입니다.
    /// 변경 시 그라디언트가 다시 그려집니다.
    var endPoint: CGPoint = CGPoint(x: 1.0, y: 0.0) {
        didSet { drawGraient() }
    }

    /// 그라디언트 색상의 위치를 지정하는 배열입니다.
    ///
    /// 각 위치 값은 0.0 ~ 1.0 사이의 숫자이며, 색상이 어디에 위치할지 결정합니다.
    /// 설정하지 않으면 색상은 균등하게 분포됩니다.
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

    /// 선형 그라디언트의 속성을 한 번에 설정합니다.
    ///
    /// - Parameters:
    ///   - colors: 그라디언트에 사용할 색상 배열입니다.
    ///   - startPoint: 그라디언트의 시작점입니다. 기본값은 위쪽 중앙입니다.
    ///   - endPoint: 그라디언트의 끝점입니다. 기본값은 아래쪽 중앙입니다.
    ///   - locations: 각 색상의 위치를 지정하는 배열입니다. 기본값은 `nil`이며, 균등하게 분포됩니다.
    ///
    /// 해당 메서드를 통해 그라디언트 색상, 방향, 분포를 간편하게 설정하실 수 있습니다.
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
