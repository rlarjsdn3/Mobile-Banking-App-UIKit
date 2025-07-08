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
    
    /// <#Description#>
    /// - Parameters:
    ///   - imageResource: <#imageResource description#>
    ///   - state: <#state description#>
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
