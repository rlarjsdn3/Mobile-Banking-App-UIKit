//
//  TintedCircleButton.swift
//  MobileBanking
//
//  Created by 김건우 on 7/6/25.
//

import UIKit

final class TintedCircleButton: UIButton {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupAttributes()
    }
    
    private func setupAttributes() {
        var config = UIButton.Configuration.filled()
        config.image = UIImage(resource: .paypal)
            .resize(newWidth: self.frame.width * 0.35)
            .withTintColor(.systemBackground, renderingMode: .alwaysTemplate)
        config.baseBackgroundColor = .bankingBlue
        config.background.cornerRadius = self.frame.width / 2
        self.configuration = config
    }
}

extension TintedCircleButton {

    /// 버튼에 표시할 이미지를 설정합니다.
    ///
    /// - Parameters:
    ///   - resource: 설정할 이미지 리소스입니다.
    ///   - sizeRatio: 버튼 크기에 대한 이미지 비율입니다. 기본값은 0.35입니다.
    ///
    /// 해당 메서드는 버튼의 프레임 크기를 기준으로 비율에 맞게 이미지를 리사이징하고,
    /// 시스템 배경색으로 틴트 처리하여 버튼에 적용합니다.
    func setImage(
        _ resource: ImageResource,
        sizeRatio: CGFloat = 0.35
    ) {
        configuration?.image = UIImage(resource: resource)
            .resize(newWidth: self.frame.width * sizeRatio)
            .withTintColor(.systemBackground, renderingMode: .alwaysTemplate)
        setNeedsUpdateConfiguration()
    }
}
